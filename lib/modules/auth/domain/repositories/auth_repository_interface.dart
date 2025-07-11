import 'package:chat_app/modules/auth/domain/entities/login_result.dart';

abstract class AuthRepositoryInterface {
  Future<void> setupUser();

  Future<LoginResult> login(String email, String password);
}
