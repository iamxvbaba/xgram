import 'package:provider_start/core/models/message/message.dart';
import 'package:provider_start/core/models/user/user.dart';

abstract class ChatStateService {
  User get currentUser;
  User get chatUser;
  void setChatUser(User model);

  List<ChatMessage> get chatUserList;
  List<ChatMessage> get msg;

  void onMessageSubmitted(ChatMessage message, {User myUser, User secondUser});
}