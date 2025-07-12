import 'package:chat_app/modules/auth/domain/entities/forgot_password_result.dart';
import 'package:chat_app/modules/auth/domain/entities/login_result.dart';
import 'package:chat_app/modules/auth/domain/entities/signup_result.dart';

abstract class AuthRepositoryInterface {
  Future<void> setupUsers();

  Future<LoginResult> login(String email, String password);

  Future<ForgotPasswordResult> resetPassword(String email);

  Future<void> setLoggedIn(bool isLoggedIn);

  Future<SignupResult> signup(
    String firstName,
    String lastName,
    String email,
    String password,
    String accountType,
    String phoneNumber,
  );
}
