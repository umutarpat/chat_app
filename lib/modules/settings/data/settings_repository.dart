import 'package:chat_app/modules/settings/domain/repositories/settings_repository_interface.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SettingsRepository implements SettingsRepositoryInterface {
  @override
  Future<void> logout() async {
    throw UnimplementedError();
  }
}
