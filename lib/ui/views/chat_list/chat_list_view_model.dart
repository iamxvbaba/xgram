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
  final _log = Logger('ContactViewModel');
  final SocketBloc _socket = locator<SocketBloc>();

  Session _session;
  Session get session => _session;

  Future<void> init() async {
    setBusy(true);
    // 获取通讯录列表
    var param = Pagination.create();
    param.page = 1;
    param.size = 10;
    _session = await _socket.send(OP.session, param,_convertSession).
    timeout(const Duration(seconds: 5)).catchError((e){
      _log.warning('获取通讯录列表 FAILED:$e');
    });
    setBusy(false);
  }

  Session _convertSession(Response resp) {
    if (resp.code != 200) {
      _log.warning('获取会话列表失败:${resp.msg}');
      return null;
    }
    if (resp.data.isEmpty) {
      _log.warning('未有会话');
      return null;
    }
    return Session.fromBuffer(resp.data);
  }

  void pushChatScreen(User chatUser) {
    //TODO: 调用接口角标设置为 0
    // 设置当前的聊天对象
    _chatStateService.setChatUser(chatUser);
    _navigationService.pushNamed(Routes.chatScreenPage);
  }
}
