import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class SettingsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get language => text().withDefault(const Constant('en'))();
  BoolColumn get isLoggedIn => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class UsersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text()();
  TextColumn get password => text()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  // for this prototype and because it is prototype, there will be only one user that can login
  // to achieve this and make second user be only chatable, we will use this column
  BoolColumn get loginPossible => boolean().withDefault(const Constant(true))();
}

class MessagesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get senderId => integer()(); // belongs to id of user
  IntColumn get receiverId => integer()(); // belongs to id of user
  TextColumn get message => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [SettingsTable, UsersTable, MessagesTable])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
