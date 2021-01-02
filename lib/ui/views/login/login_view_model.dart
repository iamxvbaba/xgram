import 'package:logging/logging.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider_start/core/exceptions/auth_exception.dart';
import 'package:provider_start/core/mixins/validators.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/ui/router.gr.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _log = Logger('HomeViewModel');

  Future<void> login(String phone, String code) async {
    setBusy(true);
    try {
      await _authService.signInWithPhone(phone, code);
      unawaited(_navigationService.popAllAndPushNamed(Routes.mainView));
    } on AuthException catch (e) {
      _log.shout(e.message);
      showToast('${e.message}');
    }
    setBusy(false);
  }
}
