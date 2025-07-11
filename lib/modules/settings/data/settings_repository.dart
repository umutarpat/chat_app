import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/settings/domain/entities/logout_result.dart';
import 'package:chat_app/modules/settings/domain/repositories/settings_repository_interface.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SettingsRepositoryInterface)
class SettingsRepository implements SettingsRepositoryInterface {
  final AppDatabase database;

  SettingsRepository(this.database);

  @override
  Future<LogoutResult> logout(bool isLoggedIn) async {
    await database
        .into(database.settingsTable)
        .insertOnConflictUpdate(
          SettingsTableCompanion(
            id: const Value(1),
            isLoggedIn: Value(isLoggedIn),
          ),
        );

    final result = await database.settingsTable.select().getSingle();

    logIt().d("User logged out state has been set on database: $result");

    return LogoutSuccess();
  }
}
