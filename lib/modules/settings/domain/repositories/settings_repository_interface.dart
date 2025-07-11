import 'package:chat_app/modules/settings/domain/entities/logout_result.dart';

abstract class SettingsRepositoryInterface {
  Future<LogoutResult> logout(bool isLoggedIn);
}
