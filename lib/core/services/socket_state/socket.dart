import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:provider_start/core/proto/config.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/account_enum.pbenum.dart';
import 'package:provider_start/core/proto/protobuf_gen/auth_key.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/account.pb.dart';
import 'package:provider_start/core/proto/util.dart';
import 'package:crypto/crypto.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class SocketBloc {
  Socket _socket;
  bool _encryptionReady = false;
  // 以下这些字段是 dh 密钥交换得到的
  List<int> _firstNonce;
  List<int> _serverNonce;
  List<int> _secondNonce;
  List<int> _authKey;
  List<int> _authKeyHash;
  List<int> _tmplAuthKeyHash;
  List<int> _nonceHash1;
  int _serverSalt;
  Uint8List _unusedData; // 缓存不完整的数据

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
  //连接
  void _initConnect() {
    print('初始化socket ===========================');
    Socket.connect(Config.socket_s, Config.socket_p).then((Socket sock) {
      _socket = sock;
      //首次必须先发送 0xaa
      _firstByte();
      // TODO: 本地先读取 auth_key
      //gen auth_key
      _reqPQ();

      sock.listen(_unpack,
          onError: _error,
          onDone: _done,
          cancelOnError: true);
    });
  }

  // 连接之后的第一个字节
  void _firstByte(){
    print('socket send firstByte');
    var message = Uint8List(1);
    var byteData = ByteData.view(message.buffer);
    byteData.setUint8(0, 0xaa);
    _socket.add(message);
  }

  int get _requestID {
    return ++_rid;
  }

  /// 发送数据
  void send(OP op,$pb.GeneratedMessage obj){
    print('1. socket send op:$op obj:$obj');
    var p = Proto.create();
    p.from = 1;     // 1 表示客户端向服务器发送消息
    p.op = op;  // 登录注册
    p.seq = $fixnum.Int64(_requestID); // 此次请求的ID
    if (_authKeyHash!= null) {
      p.authKeyHash = _authKeyHash; // dh
    }
    if (obj != null) {
      p.data = obj.writeToBuffer(); // 参数
      // 加密
      if (_encryptionReady) {
        List<int> msgKey;
        if (p.data.length < 20) {
          msgKey = utils.CreateCryptoRandomString(16);
        }else {
          msgKey = sha1.convert(p.data.sublist(4,20)).bytes;
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
    List data = lengthSizeBuf.buffer.asUint8List() + dataByte.buffer.asUint8List();
    _socket.add(data);
    //_notify,
  }

  //数据要先进行拆包
  void _unpack(Uint8List data){
    if (_unusedData!=null && _unusedData.isNotEmpty) {
      final fdata = _unusedData + data;
      data = Uint8List.fromList(fdata);
      print('>>>>>有未使用的数据!!!!!');
    }

    if (data.lengthInBytes < 4) {
      _unusedData = data;
      return;
    }
    var dataBuffer = ByteData.view(data.buffer);
    var start = 0;
    var header = 4;
    while(true) {
      var length = dataBuffer.getUint32(start);
      // 判断是否还有未读取出来的数据流
      if (length > data.lengthInBytes) {
        // 缓存起来
        _unusedData = data;
        break;
      }
      var offset = header+length;
      var p = Proto.fromBuffer(data.sublist(header,offset));
      // 解密
      if (p.msgKey.isNotEmpty && _authKey.isNotEmpty) {
        var aes = utils.GenerateAES(p.msgKey, _authKey, false);
        p.data = utils.AesDecrypt(p.data, aes.key, aes.iv);
      }
      // 处理
      _handleResult(p);
      // 读取完毕
      if (data.lengthInBytes == offset) {
        _unusedData = null;
        break;
      }
      start = offset;
      header = start + 4;
      _unusedData = null;
    }
  }

  void _handleResult(Proto p){
    var result = Response.fromBuffer(p.data);
    //print(''接收到的数据长度: $length code:${result.code} msg:${result.msg}'');
    switch (p.op) {
      case OP.resPQ:
        _resPQ(result.data);
        return;
      case OP.resDHParamsOK:
        _resDHParamsOK(result.data);
        return;
      case OP.dhGenResult:
        _dhResult(result.data);
        return;
      case OP.loginOrRegister:
        return;
      default:
        print('未知结果');
        return;
    }
    //_notify,
  }
  void _error(error, StackTrace trace){
    print('连接失败: $error');
  }

  void _done(){
    _socket.destroy();
  }


  // auth_key
  //1. send reqPQ
  void _reqPQ(){
    var rpq = ReqPQ.create();
    rpq.nonce = utils.CreateCryptoRandomString();
    _firstNonce = rpq.nonce;
    send(OP.reqPQ, rpq);
  }
  //2. res pq
  void _resPQ(List<int> data){
    var resPQ = ResPQ.fromBuffer(data);
    if (!utils.ListEQ(resPQ.nonce,_firstNonce)) {
      print('resPQ.nonce error! ${resPQ.nonce} == ${_firstNonce}');
      _socket.close();
      return;
    }
    //print(''nonce:${resPQ.nonce} serverNonce:${resPQ.serverNonce} PQ:${resPQ.pQ} publicFinger:${resPQ.serverPublicKeyFingerprint}'');
    _reqDHParams(resPQ);
  }
  //3. reqDHParams
  void _reqDHParams(ResPQ resPQ)async{
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
    var encryptData = await utils.RSAEncrypt(shaX+innerData1);
    dhParams.encryptedData = encryptData;
    send(OP.reqDHParams, dhParams);
  }

  //4. ResDHParamsOK
  void _resDHParamsOK(List<int> data){
    var resDHOK = ResDHParamsOK.fromBuffer(data);
    if (!utils.ListEQ(resDHOK.nonce,_firstNonce)) {
      print('resDHParamsOK.nonce error!');
      _socket.close();
      return;
    }
    if (!utils.ListEQ(resDHOK.serverNonce, _serverNonce)) {
      print('nonce error!');
      _socket.close();
      return;
    }

    // aes 解密
    var hash1 = sha1.convert(_secondNonce+_serverNonce).bytes;
    var hash2 = sha1.convert(_serverNonce+_secondNonce).bytes;
    var hash3 = sha1.convert(_secondNonce+_secondNonce).bytes;

    var tmpAESKey = hash1 + hash2.sublist(0,12);
    var tmpAESIV = hash2.sublist(12)+hash3+_secondNonce.sublist(4);
    var decryptData = utils.AesDecrypt(resDHOK.encryptedAnswer, tmpAESKey, tmpAESIV.sublist(0,16));
    var serverInnerData = ServerDHInnerData.fromBuffer(decryptData.sublist(20));

    // 再次校验
    if (!utils.ListEQ(serverInnerData.nonce,_firstNonce)) {
      print('serverInnerData.nonce error!');
      _socket.close();
      return;
    }

    if (!utils.ListEQ(serverInnerData.serverNonce,_serverNonce)) {
      print('serverInnerData.serverNonce error!');
      _socket.close();
      return;
    }
    // make gab

    var gabInstance = utils.MakeGAB(serverInnerData.g, BigInt.parse(serverInnerData.gA),
        BigInt.parse(serverInnerData.dhPrime));


    // 计算字段
    _authKey = utils.BigIntToUint8List(gabInstance.gab);
    //print(''authKey:$authKey'');

    // 客户端本地保存此字段
    _tmplAuthKeyHash = sha1.convert(_authKey).bytes.sublist(12,20);

    var t4 = _secondNonce+[1]+sha1.convert(_authKey).bytes.sublist(0,8);
    _nonceHash1 = sha1.convert(t4).bytes.sublist(4,20);
    var saltBuf = _secondNonce.sublist(0,8);
    saltBuf = utils.xor(saltBuf, _secondNonce);
    _serverSalt = ByteData.sublistView(Uint8List.fromList(saltBuf)).getInt64(0,Endian.little);

    //(encoding) client_DH_inner_data
    var clientDHInnerData = ClientDHInnerData.create();
    clientDHInnerData.nonce = _firstNonce;
    clientDHInnerData.serverNonce = _serverNonce;
    clientDHInnerData.retryID = $fixnum.Int64(0);
    clientDHInnerData.gB = utils.BigIntToUint8List(gabInstance.gb);
    var innerData2 = clientDHInnerData.writeToBuffer();

    var encryptedData2 = utils.AesEncrypt(innerData2, tmpAESKey, tmpAESIV.sublist(0,16));

    var cp = ClientDHParams();
    cp.nonce = _firstNonce;
    cp.serverNonce = _serverNonce;
    cp.encryptedData = encryptedData2;
    send(OP.clientDHParams, cp);
  }

  //5. dh gen result
  void _dhResult(List<int> data){
    var dhGenResult = DH_GEN.fromBuffer(data);
    if (!dhGenResult.result) {
      //TODO: 回到第一步(reqPQ)重新开始生成
      return;
    }
    // 校验
    if (!utils.ListEQ(dhGenResult.nonce,_firstNonce)) {
      print('dhGenResult.nonce error!');
      _socket.close();
      return;
    }
    if (!utils.ListEQ(dhGenResult.serverNonce,_serverNonce)) {
      print('dhGenResult.serverNonce error!');
      _socket.close();
      return;
    }
    if (!utils.ListEQ(dhGenResult.newNonceHash1,_nonceHash1)) {
      print('dhGenResult.newNonceHash1 error!');
      print('${dhGenResult.newNonceHash1},$_nonceHash1');
      _socket.close();
      return;
    }
    print('authKeyHash:$_tmplAuthKeyHash');
    print('authKeyID:${ByteData.sublistView(Uint8List.fromList(_tmplAuthKeyHash)).getInt64(0,Endian.little)}');
    print('=====链接认证成功=====');

    _authKeyHash = _tmplAuthKeyHash;
    _tmplAuthKeyHash = null;

    //此后所有与服务端之间的消息都需要加密
    _encryptionReady = true;
    //测试登录
    var loginOrRegister = LoginOrRegister.create();
    loginOrRegister.loginType = LoginType.cellphoneCode;
    loginOrRegister.cellphone = '18567913187';
    loginOrRegister.code = '1234';
    send(OP.loginOrRegister, loginOrRegister);
  }

}