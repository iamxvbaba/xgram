import 'package:logging/logging.dart';
import 'package:provider_start/core/models/message/message.dart';
import 'package:provider_start/core/models/user/user.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class ChatScreenViewModel extends BaseViewModel {
  final _chatStateService = locator<ChatStateService>();
  final _log = Logger('ChatScreenViewModel');

  User get currentUser => _chatStateService.currentUser;
  User get chatUser => _chatStateService.chatUser;
  List<ChatMessage> get msg => _chatStateService.msg;
  set changeChatUser(User model) {
    _chatStateService.setChatUser(model);
  }

  bool setIsChatScreenOpen;
  Future<void> init() async {
    setBusy(true);
    setIsChatScreenOpen = true;
    setBusy(false);
  }

  void onMessageSubmitted(ChatMessage message, {User myUser, User secondUser}) {
    _chatStateService.onMessageSubmitted(message,myUser: myUser,secondUser: secondUser);
    notifyListeners();
  }

}
