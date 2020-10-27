import 'package:logging/logging.dart';
import 'package:provider_start/core/exceptions/repository_exception.dart';
import 'package:provider_start/core/models/user/user.dart';
import 'package:provider_start/core/repositories/users_repository/users_repository.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class ChatListViewModel extends BaseViewModel {
  final _usersRepository = locator<UsersRepository>();
  final _log = Logger('ContactViewModel');

  List<User> _contacts = [];
  List<User> get contacts => _contacts;

  Future<void> init() async {
    setBusy(true);
    try {
      _contacts = await _usersRepository.fetchContact();
      print('_contacts:$_contacts');
    } on RepositoryException catch (e) {
      _log.shout(e.message);
    }
    setBusy(false);
  }
}
