import 'package:chat_app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBlocSetupUserUseCase {
  final AuthRepositoryInterface repository;

  AuthBlocSetupUserUseCase(this.repository);

  Future<void> call() async {
    await repository.setup();
  }
}
