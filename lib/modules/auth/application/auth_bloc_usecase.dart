import 'package:chat_app/modules/auth/domain/entities/forgot_password_result.dart';
import 'package:chat_app/modules/auth/domain/entities/login_result.dart';
import 'package:chat_app/modules/auth/domain/entities/signup_result.dart';
import 'package:chat_app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBlocSetupUserUseCase {
  final AuthRepositoryInterface repository;

  AuthBlocSetupUserUseCase(this.repository);

  Future<void> call() async {
    await repository.setupUsers();
  }
}

@injectable
class AuthBlocLoginUseCase {
  final AuthRepositoryInterface repository;

  AuthBlocLoginUseCase(this.repository);

  Future<LoginResult> call(String email, String password) async {
    return await repository.login(email, password);
  }
}

@injectable
class AuthBlocSetLoggedInUseCase {
  final AuthRepositoryInterface repository;

  AuthBlocSetLoggedInUseCase(this.repository);

  Future<void> call(bool isLoggedIn) async {
    return await repository.setLoggedIn(isLoggedIn);
  }
}

@injectable
class AuthBlocResetPasswordUseCase {
  final AuthRepositoryInterface repository;

  AuthBlocResetPasswordUseCase(this.repository);

  Future<ForgotPasswordResult> call(String email) async {
    return await repository.resetPassword(email);
  }
}

@injectable
class AuthBlocSignupUseCase {
  final AuthRepositoryInterface repository;

  AuthBlocSignupUseCase(this.repository);

  Future<SignupResult> call(
    String firstName,
    String lastName,
    String email,
    String password,
    String accountType,
    String phoneNumber,
  ) async {
    return await repository.signup(
      firstName,
      lastName,
      email,
      password,
      accountType,
      phoneNumber,
    );
  }
}
