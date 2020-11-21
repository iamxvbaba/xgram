import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';

abstract class ChatStateService {
  User get currentUser;
  User get chatUser;
  void setChatUser(User model);

  List<Message> get chatUserList;
  List<Message> get msg;

  void addMessage(Message message);
  void setNotify(Function f);
}