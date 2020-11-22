import 'package:event_bus/event_bus.dart';
import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:fixnum/fixnum.dart';

class ChatStateServiceImpl implements ChatStateService {
  final _authService = locator<AuthService>();
  final EventBus _eventBus = locator<EventBus>();
  final _log = Logger('ChatScreenViewModel');

  Function _notify;
  @override
  void setNotify(Function f) {
    _notify = f;
  }

  ChatStateServiceImpl(){
    _eventBus.on<Message>().listen((model) {
      print('接受到消息:$model');
      sendOrReceiveMessage(model,false);
      // 回调
      if (_notify != null) {
        _notify();
      }
    });
  }

  // 全局socket 对象
  final SocketBloc _socket = locator<SocketBloc>();

  User _chatUser;
  List<Message> _chatUserList;

  // 每个会话单独存放
  Map<String, List<Message>> _msgMap = Map<String, List<Message>>();

  @override
  User get chatUser => _chatUser;

  @override
  List<Message> get chatUserList {
    if (_chatUserList == null) {
      return null;
    } else {
      return _chatUserList;
    }
  }

  @override
  void setChatUser(User model) {
    _chatUser = model;
  }

  @override
  User get currentUser {
    return _authService.currentUser;
  }

  @override
  List<Message> get msg {
    List<Message> _msg =
        _msgMap[_calKey(_authService.currentUser.id, _chatUser.id)];
    if (_msg == null || _msg.isEmpty) {
      return null;
    } else {
      //_msg.sort((x, y) =>y.body.sendTime.compareTo(x.body.sendTime));
      return _msg;
    }
  }

  @override
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
    }
  }

  Response _convertMessage(Response resp) {
    return resp;
  }
}
