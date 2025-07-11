import 'package:chat_app/modules/settings/domain/repositories/settings_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsBlocLogoutUseCase {
  final SettingsRepositoryInterface repository;

  SettingsBlocLogoutUseCase(this.repository);

  Future<void> call() async {
    await repository.logout();
  }
}
