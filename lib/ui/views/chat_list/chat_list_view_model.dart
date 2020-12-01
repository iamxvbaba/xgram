import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/session.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/ui/router.gr.dart';
import 'package:stacked/stacked.dart';

class ChatListViewModel extends BaseViewModel {
  final _chatStateService = locator<ChatStateService>();
  final _navigationService = locator<NavigationService>();
  final _log = Logger('ChatListViewModel');

  List<Session_content> get session => _chatStateService.session;

  Future<void> init() async {
    setBusy(true);
    print('初始化 session 列表');
    await _chatStateService.initSession();
    _chatStateService.setSessionNotify(notifyListeners);
    setBusy(false);
  }

  @override
  void dispose() {
    super.dispose();
    _chatStateService.setSessionNotify(null);
  }

  void pushChatScreen(User chatUser) {
    //TODO: 调用接口角标设置为 0
    // 设置当前的聊天对象
    _chatStateService.setChatUser(chatUser);
    _navigationService.pushNamed(Routes.chatScreenPage);
  }
}
