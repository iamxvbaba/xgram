import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:provider_start/core/proto/config.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/auth_key.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/draw.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/util.dart';
import 'package:crypto/crypto.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:provider_start/core/services/event_hub/draw.dart';
import 'package:provider_start/core/services/event_hub/message.dart';
import 'package:provider_start/core/services/key_storage/key_storage_service.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/core/services/socket_state/buffer.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/ui/router.gr.dart';
import 'package:typed_data/typed_data.dart' as typed;
class SocketBloc {
  static const auth_key = 'auth_key';
  final _keyStorageService = locator<KeyStorageService>();
  final MessageEvent _msgEventBus = locator<MessageEvent>();
  final DrawEvent _drawEventBus = locator<DrawEvent>();
  final _navigationService = locator<NavigationService>();


  final Duration timeout = Duration(seconds: 7);
  Map<int, Function(Response)> call = <int, Function(Response)>{};

  Socket _socket;
  bool _encryptionReady = false;
  bool _inGenKey = false;

  // 以下这些字段是 dh 密钥交换得到的
  List<int> _firstNonce;
  List<int> _serverNonce;
  List<int> _secondNonce;
  List<int> _authKey;
  List<int> _authKeyHash;
  List<int> _tmplAuthKeyHash;
  List<int> _nonceHash1;

  FByteBuffer messageStream;

  int _rid = 1;

  factory SocketBloc() => _getInstance();

  static SocketBloc get instance => _getInstance();
  static SocketBloc _instance;

  static SocketBloc _getInstance() {
    _instance ??= SocketBloc._();
    return _instance;
  }

  SocketBloc._() {
    // 初始化
    _initConnect();
  }
  int _errorReconnect=0;
  // 0: change network
  // 1: error reconnect
  void reconnect({int reconnectType=0}){
    if (reconnectType == 1) {
      if (_errorReconnect >= 5) {
        print('socket error reconnect 5 times!!!!');
        return;
      }
      _errorReconnect++;
    }
    print('socket 进行重连!!! reconnectType:$reconnectType');
    _initConnect();
  }

  //连接
  void _initConnect() {
    _socket?.close();
    if (_socket != null ) {
      _socket = null;
    }
    call.clear();

    Socket.connect(Config.socket_s, Config.socket_p).then((Socket sock) {
      _socket = sock;
      messageStream = FByteBuffer(typed.Uint8Buffer());
      sock.listen(_onData, onError: _error, onDone: _done, cancelOnError: true);
      //首次必须先发送 0xaa
      _firstByte();
      //gen auth_key
      _genAuthKey();
    }).catchError((err){
      print('connection error:$err');
      reconnect(reconnectType: 1);
    });
  }

  // 连接之后的第一个字节
  void _firstByte() {
    print('socket send firstByte');
    var message = Uint8List(1);
    var byteData = ByteData.view(message.buffer);
    byteData.setUint8(0, 0xaa);
    _socket.add(message);
  }

  int get _requestID {
    return ++_rid;
  }

  Future<$pb.GeneratedMessage> send(OP op, $pb.GeneratedMessage obj,
      $pb.GeneratedMessage Function(Response resp) handler) async {

    var id = _requestID;
    _send($fixnum.Int64(id),op, obj);

    Completer<$pb.GeneratedMessage> c = Completer();

    Timer timeoutTimer;
    if (timeout != null) {
      timeoutTimer = Timer(timeout, () {
        print('请求超时 移除回调:$id');
        call.remove(id);
      });
    }

    call[id] = (Response resp) {
      timeoutTimer?.cancel();
      var result = handler(resp);
      c.complete(result);
    };
    return c.future;
  }

  /// 发送数据
  void _send($fixnum.Int64 id,OP op, $pb.GeneratedMessage obj) {
    var p = Proto.create();
    p.from = 1; // 1 表示客户端向服务器发送消息
    p.op = op; // 登录注册
    p.seq = id; // 此次请求的ID
    if (_authKeyHash != null) {
      p.authKeyHash = _authKeyHash; // dh
    }
    if (obj != null) {
      p.data = obj.writeToBuffer(); // 参数
      // 加密
      if (_encryptionReady) {
        List<int> msgKey;
        if (p.data.length < 20) {
          msgKey = utils.CreateCryptoRandomString(16);
        } else {
          msgKey = sha1.convert(p.data.sublist(4, 20)).bytes;
        }
        var aes = utils.GenerateAES(msgKey, _authKey, false);
        p.msgKey = msgKey;
        p.data = utils.AesEncrypt(p.data, aes.key, aes.iv);
      }
    }
    var dataByte = p.writeToBuffer();
    var lengthSizeBuf = ByteData(4);
    lengthSizeBuf.setUint32(0, dataByte.lengthInBytes); // 数据长度
    // 转化为[]byte发送
    List data =
        lengthSizeBuf.buffer.asUint8List() + dataByte.buffer.asUint8List();
    _socket.add(data);
  }

  void _onData(Uint8List data) {

    messageStream.addAll(data);

    while (messageStream.isMessageAvailable()) {
      var protoIsValid = true;
      int length;
      Proto p;
      if (messageStream.length < 4) {
        protoIsValid = false;
      } else {
        length = messageStream.readUInt32(); // ByteData.view(messageStream.read(4).buffer).getUint32(0);
        if (messageStream.availableBytes < length) {
          protoIsValid = false;
        }
      }
      if (!protoIsValid) {
        messageStream.reset();
        print(
            'Connection::waiting for more data ...');
        return;
      }

      p = Proto.fromBuffer(messageStream.read(length));
      if (protoIsValid) {
        messageStream.shrink();
      }
      // 解密
      if (p.msgKey.isNotEmpty && _authKey.isNotEmpty) {
        var aes = utils.GenerateAES(p.msgKey, _authKey, false);
        p.data = utils.AesDecrypt(p.data, aes.key, aes.iv);
      }
      // 处理
      _handleResult(p);
    }
  }

  void _handleResult(Proto p) {
    var result = Response.fromBuffer(p.data);
    switch (p.op) {
      case OP.needDH:
        if (_inGenKey) {
          return;
        }
        _navigationService.popAllAndPushNamed(Routes.loginView);
        _keyStorageService.del(auth_key);
        _initConnect();
        return;
      case OP.needLogin:
        // 需要登录,跳转到登录页
        _navigationService.popAllAndPushNamed(Routes.loginView);
        return;
      case OP.receiveSingle:
        var msg = Message.fromBuffer(result.data);
        print('======socket 收到消息======$msg');
        _msgEventBus.eventBus.fire(msg);
        return;
      case OP.drawC:
        var drawParam = DrawParam.fromBuffer(result.data);
        print('======socket 收到绘画通知======$drawParam');
        _drawEventBus.eventBus.fire(drawParam);
        return;
      default:
        var id = p.seq.toInt();
        var cb = call[id];
        if (cb != null) {
          cb(result);
          call.remove(id);
          print('call callback success $id');
        }
    }
  }

  void _error(error, StackTrace trace) {
    print('连接失败: $error');
    reconnect(reconnectType: 1);
  }

  void _done() {
    _socket?.destroy();
  }

  // auth_key
  void _genAuthKey() async {
    _inGenKey = true;
    _encryptionReady = false;
    if (_authKey != null) {
      _authKey = null;
    }
    if (_authKeyHash != null ){
      _authKeyHash = null;
    }
    var _authKeyString = _keyStorageService.get(auth_key);
    if (_authKeyString != null) {
      _authKey = base64.decode(_authKeyString);
      _authKeyHash = sha1.convert(_authKey).bytes.sublist(12, 20);
      _encryptionReady = true;
      print('使用本地的authKey:$_authKeyHash');
      _inGenKey = false;
      return null;
    }
    var rpq = ReqPQ.create();
    rpq.nonce = utils.CreateCryptoRandomString();
    _firstNonce = rpq.nonce;
    // 1.
    ResPQ resPQ = await send(OP.reqPQ, rpq, _resPQ);

    // 2.
    var dhParams = await _reqDHParams(resPQ);
    ClientDHParams dhParamOK =
        await send(OP.reqDHParams, dhParams, _resDHParamsOK);

    // 3.
    DH_GEN dhGen = await send(OP.clientDHParams, dhParamOK, _dhResult);
    print('gen auth_key result:$dhGen');
    _inGenKey = false;
  }

  //2. res pq
  ResPQ _resPQ(Response resp) {
    var resPQ = ResPQ.fromBuffer(resp.data);
    if (!utils.ListEQ(resPQ.nonce, _firstNonce)) {
      print('resPQ.nonce error! ${resPQ.nonce} == ${_firstNonce}');
      _socket.close();
      return null;
    }
    return resPQ;
  }

  //3. reqDHParams
  Future<ReqDHParams> _reqDHParams(ResPQ resPQ) async {
    var dhParams = ReqDHParams.create();
    dhParams.nonce = resPQ.nonce;
    dhParams.serverNonce = resPQ.serverNonce;
    _serverNonce = resPQ.serverNonce;
    dhParams.publicKeyFingerprint = $fixnum.Int64(utils.publicKeyPrint);
    //todo: PQ分解
    var pq = utils.SplitPQ(resPQ.pQ);
    dhParams.p = pq.p;
    dhParams.q = pq.q;

    // pqInnerData
    var pqInnerData = PQInnerData.create();
    pqInnerData.pQ = resPQ.pQ;
    pqInnerData.p = pq.p;
    pqInnerData.q = pq.q;
    pqInnerData.nonce = resPQ.nonce;
    pqInnerData.serverNonce = resPQ.serverNonce;
    pqInnerData.newNonce = utils.CreateCryptoRandomString(32);
    _secondNonce = pqInnerData.newNonce;
    var innerData1 = pqInnerData.writeToBuffer();

    //sha1 加密innerData
    var shaX = sha1.convert(innerData1).bytes;
    //rsa 加密
    var encryptData = await utils.RSAEncrypt(shaX + innerData1);
    dhParams.encryptedData = encryptData;
    return dhParams;
  }

  //4. ResDHParamsOK
  ClientDHParams _resDHParamsOK(Response resp) {
    var resDHOK = ResDHParamsOK.fromBuffer(resp.data);
    if (!utils.ListEQ(resDHOK.nonce, _firstNonce)) {
      print('resDHParamsOK.nonce error!');
      return null;
    }
    if (!utils.ListEQ(resDHOK.serverNonce, _serverNonce)) {
      print('nonce error!');
      return null;
    }

    // aes 解密
    var hash1 = sha1.convert(_secondNonce + _serverNonce).bytes;
    var hash2 = sha1.convert(_serverNonce + _secondNonce).bytes;
    var hash3 = sha1.convert(_secondNonce + _secondNonce).bytes;

    var tmpAESKey = hash1 + hash2.sublist(0, 12);
    var tmpAESIV = hash2.sublist(12) + hash3 + _secondNonce.sublist(4);
    var decryptData = utils.AesDecrypt(
        resDHOK.encryptedAnswer, tmpAESKey, tmpAESIV.sublist(0, 16));
    var serverInnerData = ServerDHInnerData.fromBuffer(decryptData.sublist(20));

    // 再次校验
    if (!utils.ListEQ(serverInnerData.nonce, _firstNonce)) {
      print('serverInnerData.nonce error!');
      return null;
    }

    if (!utils.ListEQ(serverInnerData.serverNonce, _serverNonce)) {
      print('serverInnerData.serverNonce error!');
      return null;
    }
    // make gab

    var gabInstance = utils.MakeGAB(
        serverInnerData.g,
        BigInt.parse(serverInnerData.gA),
        BigInt.parse(serverInnerData.dhPrime));

    // 计算字段
    _authKey = utils.BigIntToUint8List(gabInstance.gab);
    //print(''authKey:$authKey'');

    // 客户端本地保存此字段
    _tmplAuthKeyHash = sha1.convert(_authKey).bytes.sublist(12, 20);

    var t4 = _secondNonce + [1] + sha1.convert(_authKey).bytes.sublist(0, 8);
    _nonceHash1 = sha1.convert(t4).bytes.sublist(4, 20);
    var saltBuf = _secondNonce.sublist(0, 8);
    saltBuf = utils.xor(saltBuf, _secondNonce);

    //(encoding) client_DH_inner_data
    var clientDHInnerData = ClientDHInnerData.create();
    clientDHInnerData.nonce = _firstNonce;
    clientDHInnerData.serverNonce = _serverNonce;
    clientDHInnerData.retryID = $fixnum.Int64(0);
    clientDHInnerData.gB = utils.BigIntToUint8List(gabInstance.gb);
    var innerData2 = clientDHInnerData.writeToBuffer();

    var encryptedData2 =
        utils.AesEncrypt(innerData2, tmpAESKey, tmpAESIV.sublist(0, 16));

    var cp = ClientDHParams();
    cp.nonce = _firstNonce;
    cp.serverNonce = _serverNonce;
    cp.encryptedData = encryptedData2;
    return cp;
  }

  //5. dh gen result
  DH_GEN _dhResult(Response resp) {
    var dhGenResult = DH_GEN.fromBuffer(resp.data);
    if (!dhGenResult.result) {
      //TODO: 回到第一步(reqPQ)重新开始生成
      return null;
    }
    // 校验
    if (!utils.ListEQ(dhGenResult.nonce, _firstNonce)) {
      print('dhGenResult.nonce error!');
      _socket.close();
      return null;
    }
    if (!utils.ListEQ(dhGenResult.serverNonce, _serverNonce)) {
      print('dhGenResult.serverNonce error!');
      _socket.close();
      return null;
    }
    if (!utils.ListEQ(dhGenResult.newNonceHash1, _nonceHash1)) {
      print('dhGenResult.newNonceHash1 error!');
      print('${dhGenResult.newNonceHash1},$_nonceHash1');
      _socket.close();
      return null;
    }
    print('authKeyHash:$_tmplAuthKeyHash');
    print(
        'authKeyID:${ByteData.sublistView(Uint8List.fromList(_tmplAuthKeyHash)).getInt64(0, Endian.little)}');
    print('=====链接认证成功=====');

    _authKeyHash = _tmplAuthKeyHash;

    _keyStorageService.set(auth_key, base64.encode(_authKey));
    print('_keyStorageService:${_keyStorageService.get(auth_key)}');

    _tmplAuthKeyHash = null;
    //此后所有与服务端之间的消息都需要加密
    _encryptionReady = true;
    //测试登录
    return dhGenResult;
  }
}
