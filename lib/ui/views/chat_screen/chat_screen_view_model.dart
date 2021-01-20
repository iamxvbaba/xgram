import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/ui/router.gr.dart';
import 'package:stacked/stacked.dart';

class ChatScreenViewModel extends BaseViewModel {
  final _chatStateService = locator<ChatStateService>();
  final _navigationService = locator<NavigationService>();

  final ScrollController listScrollController = ScrollController();
  final _log = Logger('ChatScreenViewModel');

  final changeNotifier =  StreamController.broadcast();
  bool isShowLoading = false;
  bool isBottomLayoutShowing = false;

  User get currentUser => _chatStateService.currentUser;
  User get chatUser => _chatStateService.chatUser;
  List<Message> get msg {
    print('有更新消息!!!!!!!!!!!!!!!!!!!!!!!');
    return _chatStateService.msg;
  }
  set changeChatUser(User model) {
    _chatStateService.setChatUser(model);
  }
  Future<void> init() async {
    isShowLoading = true;
    _chatStateService.setNotify(notifyListeners);
    await _chatStateService.loadMoreMsg();
    setBusy(false);
    isShowLoading = false;
  }

  void onAddMessage(Message message,bool send) {
    _chatStateService.addMessage(message);
    notifyListeners();
  }
  void pushSelectImage() {
    print('<pushSelectImage>');
    _navigationService.pushNamed(Routes.selectImage,arguments: SelectImageArguments(title: 'image'));
  }
  @override
  void dispose() {
    super.dispose();
    listScrollController.dispose();
    changeNotifier.close();
    _chatStateService.setNotify(null);
  }
}
