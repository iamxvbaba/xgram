import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/ui/router.gr.dart';
import 'package:stacked/stacked.dart';

class ChatListViewModel extends BaseViewModel {
  // final _usersRepository = locator<UsersRepository>();
  final _navigationService = locator<NavigationService>();
  final _log = Logger('ContactViewModel');
  final SocketBloc _socket = locator<SocketBloc>();

  UserList _contacts;
  UserList get contacts => _contacts;

  Future<void> init() async {
    setBusy(true);
    // 获取通讯录列表
    var param = Pagination.create();
    param.page = 1;
    param.size = 10;
    print('=====获取通讯录列表=====');
    _contacts = await _socket.send(OP.contact, param,_convertUser).
    timeout(const Duration(seconds: 5)).catchError((e){
      print('获取通讯录列表 FAILED:$e');
    });
    setBusy(false);
  }

  UserList _convertUser(List<int> data) {
    print('获取通讯录列表 返回!!!');
    return UserList.fromBuffer(data);
  }

  void pushChatScreen() {
    _navigationService.pushNamed(Routes.chatScreenPage);
  }
}
