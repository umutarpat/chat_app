import 'package:chat_app/modules/auth/domain/entities/login_result.dart';
import 'package:chat_app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBlocSetupUserUseCase {
  final AuthRepositoryInterface repository;

  AuthBlocSetupUserUseCase(this.repository);

  Future<void> call() async {
    await repository.setupUser();
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
