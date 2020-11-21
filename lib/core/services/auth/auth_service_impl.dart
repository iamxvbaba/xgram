import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/exceptions/auth_exception.dart';
import 'package:provider_start/core/proto/protobuf_gen/account.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';

class AuthServiceImpl implements AuthService {
  final _log = Logger('AuthServiceImpl');
  final SocketBloc _socket = locator<SocketBloc>();

  User _currentUser;

  @override
  User get currentUser => _currentUser;

  @override
  Future<void> signInWithPhone(
    String phone,
    String code,
  ) async {
    try {
      // authenticate with server
      var param = LoginOrRegister.create();
      param.cellphone = phone;
      param.code = code;
      _currentUser = await _socket
          .send(OP.loginOrRegister, param, _convertUser)
          .timeout(const Duration(seconds: 5))
          .catchError((e) {
        print('登录超时:$e');
      });
      // fetch current user from server

    } on Exception {
      _log.severe('AuthService: Error signing up');
      throw AuthException('Error signing up');
    }
  }

  User _convertUser(Response resp) {
    print('登录返回:$resp');
    return User.fromBuffer(resp.data);
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(Duration(milliseconds: 250));
    _currentUser = null;
  }

  @override
  Future<bool> isUserLoggedIn() async {
    // check server for login status
    await Future.delayed(Duration(seconds: 1));
    // 先跳过登录
    /*
    _currentUser ??= User(
      (u) => u
        ..id = 1
        ..email = '944808666@qq.com'
        ..username = 'xuhui'
        ..name = 'xuhui',
    );
     */
    return _currentUser != null;
  }
}
