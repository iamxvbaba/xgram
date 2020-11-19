
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';

abstract class AuthService {
  User get currentUser;

  Future<void> signInWithPhone(
    String phone,
    String code,
  );

  Future<void> signOut();

  Future<bool> isUserLoggedIn();
}
