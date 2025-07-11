import 'package:chat_app/modules/settings/domain/entities/logout_result.dart';
import 'package:chat_app/modules/settings/domain/repositories/settings_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsBlocLogoutUseCase {
  final SettingsRepositoryInterface repository;

  SettingsBlocLogoutUseCase(this.repository);

  Future<LogoutResult> call(bool isLoggedIn) async {
    return await repository.logout(isLoggedIn);
  }
}
