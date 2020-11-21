import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class ChatScreenViewModel extends BaseViewModel {
  final _chatStateService = locator<ChatStateService>();
  final EventBus _eventBus = locator<EventBus>();
  final _log = Logger('ChatScreenViewModel');
  StreamSubscription<Message> _stream;
  User get currentUser => _chatStateService.currentUser;
  User get chatUser => _chatStateService.chatUser;
  List<Message> get msg => _chatStateService.msg;
  set changeChatUser(User model) {
    _chatStateService.setChatUser(model);
  }
  bool setIsChatScreenOpen;
  Future<void> init() async {
    _stream = _eventBus.on<Message>().listen((model) {
      print('接受到消息:$model');
      onAddMessage(model,false);
    });
    setBusy(true);
    setIsChatScreenOpen = true;
    setBusy(false);
  }


  void onAddMessage(Message message,bool send) {
    _chatStateService.addMessage(message,send);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _stream.cancel();
  }
}
