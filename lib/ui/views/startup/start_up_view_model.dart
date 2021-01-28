import 'package:pedantic/pedantic.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/core/services/hardware_info/hardware_info_service.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/ui/router.gr.dart';
import 'package:stacked/stacked.dart';

class StartUpViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final hardwareInfoService = locator<HardwareInfoService>();

  Future handleStartUpLogic() async {
    final hasLoggedInUser = await _authService.isUserLoggedIn();

    await Future.wait([
      hardwareInfoService.init(),
    ]);

    if (hasLoggedInUser) {
      unawaited(_navigationService.pushReplacementNamed(Routes.mainView));
    } else {
      unawaited(_navigationService.pushReplacementNamed(Routes.loginView));
    }
  }
}
