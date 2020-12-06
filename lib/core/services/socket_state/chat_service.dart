import 'package:event_bus/event_bus.dart';
import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/session.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:fixnum/fixnum.dart';

class ChatStateService {
  final _authService = locator<AuthService>();
  final EventBus _eventBus = locator<EventBus>();
  final _log = Logger('ChatScreenViewModel');
  final SocketBloc _socket = locator<SocketBloc>();

  Function _notify;
  void setNotify(Function f) {
    _notify = f;
  }

  Function _sessionNotify;
  void setSessionNotify(Function f) {
    _sessionNotify = f;
  }

  factory ChatStateService() => _getInstance();

  static ChatStateService get instance => _getInstance();
  static ChatStateService _instance;

  static ChatStateService _getInstance() {
    _instance ??= ChatStateService._();
    return _instance;
  }
  ChatStateService._() {
    _eventBus.on<Message>().listen((model) {
      print('接受到消息:$model');
      sendOrReceiveMessage(model,false);
      // 回调
      if (_notify != null) {
        _notify();
      }
    });
  }



  User _chatUser;
  List<Message> _chatUserList;

  // 每个会话单独存放
  Map<String, List<Message>> _msgMap = Map<String, List<Message>>();

  User get chatUser => _chatUser;

  List<Message> get chatUserList {
    if (_chatUserList == null) {
      return null;
    } else {
      return _chatUserList;
    }
  }

  void setChatUser(User model) {
    _chatUser = model;
  }

  User get currentUser {
    return _authService.currentUser;
  }

  List<Message> get msg {
    var _msg =
        _msgMap[_calKey(_authService.currentUser.id, _chatUser.id)];
    if (_msg == null || _msg.isEmpty) {
      return null;
    } else {
      //_msg.sort((x, y) =>y.body.sendTime.compareTo(x.body.sendTime));
      return _msg;
    }
  }

  void addMessage(Message message) {
    sendOrReceiveMessage(message,true);
    _log.fine('add message');
  }

  String _calKey(Int64 senderID, Int64 userID) {
    if (senderID > userID) {
      return userID.toString() + '_' + senderID.toString();
    }
    return senderID.toString() + '_' + userID.toString();
  }

  Future<void> sendOrReceiveMessage(Message model,bool send) async {
    var key = _calKey(model.senderID, model.userID);
    if (_msgMap[key] == null) {
      _msgMap[key] = <Message>[];
    }
    _msgMap[key].insert(0,model);
    print('添加消息:${model.body.msg}');
    if (send) {
      Response resp = await _socket.send(OP.pushSingle, model, _convertMessage);
      if (resp.code != 200) {
        _log.warning('发送消息失败:${resp.msg}');
        return null;
      }
      if (_sessionMap != null) {
        _sessionMap.list[model.userID].msg = model;
      }
    } else {
      if (_sessionMap != null) {
        _sessionMap.list[model.senderID].msg = model;
        _sessionMap.list[model.senderID].badge++;
      }
    }
    if(_sessionNotify != null) {
      _sessionNotify();
    }
  }

  Response _convertMessage(Response resp) {
    return resp;
  }

  //==============session==================
  Session _sessionMap;
  List<Session_content> get session {
    if (_sessionMap != null && _sessionMap.list.isNotEmpty) {
      return _sessionMap.list.values.toList();
    }
    return null;
  }

  Future<void> initSession() async {
    // 获取通讯录列表
    var param = Pagination.create();
    param.page = 1;
    param.size = 50;
    _sessionMap = await _socket.send(OP.session, param,_convertSession).
    timeout(const Duration(seconds: 5)).catchError((e){
      _log.warning('获取通讯录列表 FAILED:$e');
    });
  }

  Session _convertSession(Response resp) {
    if (resp.code != 200) {
      _log.warning('获取会话列表失败:${resp.msg}');
      return null;
    }
    if (resp.data.isEmpty) {
      _log.warning('未有会话');
      return null;
    }
    return Session.fromBuffer(resp.data);
  }
}
