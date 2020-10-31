import 'package:logging/logging.dart';
import 'package:provider_start/core/models/message/message.dart';
import 'package:provider_start/core/models/user/user.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class ChatScreenViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _log = Logger('ChatScreenViewModel');
  User get currentUser => _authService.currentUser;

  bool setIsChatScreenOpen;

  List<ChatMessage> _chatUserList;

  /// Contain list of users who have chat history with logged in user
  List<ChatMessage> get chatUserList {
    if (_chatUserList == null) {
      return null;
    } else {
      return List.from(_chatUserList);
    }
  }

  User _chatUser;
  User get chatUser {
    if (_chatUser == null) {
      print('返回当前用户:${_authService.currentUser}');
      return _authService.currentUser;
    }
    return _chatUser ?? _authService.currentUser;
  }

  set setChatUser(User model) {
    _chatUser = model;
  }

  List<ChatMessage> _msg = [];
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

  Future<void> init() async {
    setBusy(true);
    setIsChatScreenOpen = true;
    setBusy(false);
  }

  void disposex() {
    var user = _chatUserList.firstWhere((x) => x.key == chatUser.id.toString());
    if (_msg != null) {
      user.message = _msg.first.message;
      user.createdAt = _msg.first.createdAt;
      _msg = null;
      notifyListeners();
    }

    /// [Warning] do not call super.dispose() from this method
    /// If this method called here it will dipose chat state data
    // super.dispose();
  }

  void onMessageSubmitted(ChatMessage message, {User myUser, User secondUser}) {
    sendAndRetrieveMessage(message);
    _log.fine('send_message');
  }

  void sendAndRetrieveMessage(ChatMessage model) async {
    _msg ??= <ChatMessage>[];
    _msg.add(model);

    notifyListeners();
  }
}
