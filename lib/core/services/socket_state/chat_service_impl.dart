
import 'package:logging/logging.dart';
import 'package:provider_start/core/models/message/message.dart';
import 'package:provider_start/core/models/user/user.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';

class ChatStateServiceImpl implements ChatStateService{
  final _authService = locator<AuthService>();
  final _log = Logger('ChatScreenViewModel');

  // 全局socket 对象
  final SocketBloc _socketBloc = SocketBloc();

  User _chatUser;
  List<ChatMessage> _chatUserList;
  List<ChatMessage> _msg = [];
  @override
  User get chatUser => _authService.currentUser;

  @override
  // TODO: implement chatUserList
  List<ChatMessage> get chatUserList {
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
  User get currentUser  {
    if (_chatUser == null) {
      print('返回当前用户:${_authService.currentUser}');
      return _authService.currentUser;
    }
    return _chatUser ?? _authService.currentUser;
  }

  @override
  List<ChatMessage> get msg {
    if (_msg == null) {
      return null;
    } else {
      _msg.sort((x, y) => DateTime.parse(y.createdAt)
          .toLocal()
          .compareTo(DateTime.parse(x.createdAt).toLocal()));
      return _msg;
    }
  }

  @override
  void onMessageSubmitted(ChatMessage message, {User myUser, User secondUser}) {
    sendAndRetrieveMessage(message);
    _log.fine('send_message');
  }

  void sendAndRetrieveMessage(ChatMessage model) {
    _msg ??= <ChatMessage>[];
    _msg.add(model);
  }
}