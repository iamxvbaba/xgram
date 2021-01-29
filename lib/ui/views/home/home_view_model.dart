import 'package:logging/logging.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _log = Logger('HomeViewModel');
  final SocketBloc _socket = locator<SocketBloc>();


  Future<void> init() async {
    setBusy(true);

    setBusy(false);
  }

}
