import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class SearchModel extends BaseViewModel {
  final SocketBloc _socket = locator<SocketBloc>();
  void search(String key) {
    setBusy(true);
    //TODO 进行搜索

    setBusy(false);
  }
}