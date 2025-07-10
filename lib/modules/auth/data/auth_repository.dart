import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepositoryInterface)
class AuthRepository extends AuthRepositoryInterface {
  @override
  Future<void> setup() async {
    final database = AppDatabase();

    await database
        .into(database.usersTable)
        .insertOnConflictUpdate(
          UsersTableCompanion(
            id: const Value(1),
            email: Value("case_study@innoscripta.com"),
            password: Value("CaseStudyInnoscripta2025!"),
          ),
        );

    final result = await database.usersTable.select().getSingle();

    logIt().d("User setup: $result");
  }

  @override
  Future<void> login(String email, String password) async {
    // TODO: implement login
  }
}
