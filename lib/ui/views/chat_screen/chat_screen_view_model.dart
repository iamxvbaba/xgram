import 'dart:async';

import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class ChatScreenViewModel extends BaseViewModel {
  final _chatStateService = locator<ChatStateService>();
  final _log = Logger('ChatScreenViewModel');

  User get currentUser => _chatStateService.currentUser;
  User get chatUser => _chatStateService.chatUser;
  List<Message> get msg => _chatStateService.msg;
  set changeChatUser(User model) {
    _chatStateService.setChatUser(model);
  }
  bool setIsChatScreenOpen;
  Future<void> init() async {
    _chatStateService.setNotify(notifyListeners);
    setBusy(true);
    setIsChatScreenOpen = true;
    setBusy(false);
  }

  void onAddMessage(Message message,bool send) {
    _chatStateService.addMessage(message);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _chatStateService.setNotify(null);
  }
}
