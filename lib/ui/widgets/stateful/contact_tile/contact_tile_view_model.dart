import 'package:provider_start/core/models/user/user.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class ContactTileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  User _user;
  User get user => _user;

  void init(User user) {
    _user = user;
  }

  void showChatScreen() {
    print('chat screen');
  }
}
