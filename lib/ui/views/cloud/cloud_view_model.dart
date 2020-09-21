import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/ui/router.gr.dart';
import 'package:stacked/stacked.dart';

class CloudViewModel extends BaseViewModel {
  final _log = Logger('CloudViewModel');
  final _navigationService = locator<NavigationService>();

  void toFMView() {
    _log.fine('pushReplacement PlayListView');
    unawaited(_navigationService.pushNamed(Routes.playListView));
  }
}
