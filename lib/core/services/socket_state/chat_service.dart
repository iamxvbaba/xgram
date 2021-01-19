import 'package:logging/logging.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/session.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/core/services/event_hub/message.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:fixnum/fixnum.dart';

class ChatStateService {
  final _authService = locator<AuthService>();
  final MessageEvent _eventBus = locator<MessageEvent>();
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
    _eventBus.eventBus.on<Message>().listen((model) {
      print('接受到消息:$model');
      sendOrReceiveMessage(model, false);
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
  Map<String, bool> _msgNomore = Map<String, bool>(); // 没有更多消息了

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

  //TODO: 向上加载更多消息
  Future<List<Message>> loadMoreMsg() async {
    String key = _calKey(_authService.currentUser.id, _chatUser.id);
    var _msg = _msgMap[key];
    if (_msg == null) {
      _msg = List<Message>();
      _msgMap[key] = _msg;
    }
    var no = _msgNomore[key];
    if (!no) {
      print('没有更多消息了!!!!');
      //_msg.sort((x, y) =>y.body.sendTime.compareTo(x.body.sendTime));
      return _msg;
    }
    Int64 sendTime;
    if (msg != null) {
      sendTime = msg.first.body.sendTime;
    } else {
      sendTime = Int64(DateTime
          .now()
          .millisecondsSinceEpoch);
    }
    SessionHistoryArg arg = SessionHistoryArg.create();
    arg.sendTime = sendTime;
    arg.userID = chatUser.id;
    arg.size = 20;
    arg.first = false;
    MessageList moreMsg = await _socket.send(
        OP.sessionHistory, arg, _convertMoreMsg);
    if (moreMsg == null || moreMsg.list.isEmpty) {
      print('1.没有更多消息了!!!!');
      _msgNomore[key] = true;
      return _msg;
    } else {
      // 添加到msgMap
      moreMsg.list.forEach((element) {
        _msg.insert(0, element);
      });
      if (moreMsg.list.length < 20) {
        print('2.没有更多消息了!!!!');
        _msgNomore[key] = true;
      }
      _msgMap[key] = _msg;
    }
    return _msg;
  }

  MessageList _convertMoreMsg(Response resp) {
    if (resp.code != 200) {
      showToast('加载更多消息失败:${resp.msg}');
      return null;
    }
    if (resp.data.isEmpty) {
      showToast('没有更多消息了');
      return null;
    }
    return MessageList.fromBuffer(resp.data);
  }


  void addMessage(Message message) {
    sendOrReceiveMessage(message, true);
    _log.fine('add message');
  }

  String _calKey(Int64 senderID, Int64 userID) {
    if (senderID > userID) {
      return userID.toString() + '_' + senderID.toString();
    }
    return senderID.toString() + '_' + userID.toString();
  }

  Future<void> sendOrReceiveMessage(Message model, bool send) async {
    var key = _calKey(model.senderID, model.userID);
    if (_msgMap[key] == null) {
      _msgMap[key] = <Message>[];
    }
    _msgMap[key].insert(0, model);
    print('添加消息:${model.body.msg}');
    if (send) {
      Response resp = await _socket.send(OP.pushSingle, model, _convertMessage);
      if (resp.code != 200) {
        showToast('发送消息失败:${resp.msg}');
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
    if (_sessionNotify != null) {
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

  Future<List<Session_content>> refreshSession() async {
    // 获取通讯录列表
    var param = Pagination.create();
    param.page = 1;
    param.size = 30;
    _sessionMap = await _socket.send(OP.session, param, _convertSession).
    timeout(const Duration(seconds: 7)).catchError((e) {
      showToast('刷新session列表 FAILED:$e');
    });
    if (_sessionMap != null && _sessionMap.list.isNotEmpty) {
      return _sessionMap.list.values.toList();
    }
    return null;
  }

  Future<List<Session_content>> moreSession(int page) async {
    var param = Pagination.create();
    param.page = page;
    param.size = 30;
    Session _moreSessionMap = await _socket.send(
        OP.session, param, _convertSession).
    timeout(const Duration(seconds: 7)).catchError((e) {
      showToast('下滑加载session列表 FAILED:$e');
    });
    if (_moreSessionMap != null && _moreSessionMap.list.isNotEmpty) {
      return _moreSessionMap.list.values.toList();
    }
    return null;
  }

  Future<void> initSession() async {
    // 获取通讯录列表
    var param = Pagination.create();
    param.page = 1;
    param.size = 30;
    _sessionMap = await _socket.send(OP.session, param, _convertSession).
    timeout(const Duration(seconds: 5)).catchError((e) {
      showToast('初始化session列表 FAILED:$e');
    });
  }

  Session _convertSession(Response resp) {
    if (resp.code != 200) {
      showToast('获取会话列表失败:${resp.msg}');
      return null;
    }
    if (resp.data.isEmpty) {
      showToast('未有会话');
      return null;
    }
    return Session.fromBuffer(resp.data);
  }
}
