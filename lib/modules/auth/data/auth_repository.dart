import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/auth/domain/entities/forgot_password_result.dart';
import 'package:chat_app/modules/auth/domain/entities/login_result.dart';
import 'package:chat_app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepositoryInterface)
class AuthRepository extends AuthRepositoryInterface {
  final _database = AppDatabase();
  @override
  Future<void> setupUser() async {
    await _database
        .into(_database.usersTable)
        .insertOnConflictUpdate(
          UsersTableCompanion(
            id: const Value(1),
            email: Value("case_study@innoscripta.com"),
            password: Value("CaseStudyInnoscripta2025!"),
          ),
        );

    final result = await _database.usersTable.select().getSingle();

    logIt().d("User setup: $result");
  }

  @override
  Future<LoginResult> login(String email, String password) async {
    final user =
        await (_database.select(_database.usersTable)..where(
              (u) => u.email.equals(email) & u.password.equals(password),
            ))
            .getSingleOrNull();

    if (user == null) return LoginFailure("User not found");

    logIt().d("User login: $user");
    return LoginSuccess();
  }

  @override
  Future<ForgotPasswordResult> resetPassword(String email) async {
    final user = await (_database.select(
      _database.usersTable,
    )..where((u) => u.email.equals(email))).getSingleOrNull();

    if (user == null) return ForgotPasswordUserDoesntExist();

    logIt().d("User reset password: $user");

    return ForgotPasswordSuccess();
  }
}
