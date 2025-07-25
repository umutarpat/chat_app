import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/auth/domain/entities/forgot_password_result.dart';
import 'package:chat_app/modules/auth/domain/entities/login_result.dart';
import 'package:chat_app/modules/auth/domain/entities/signup_result.dart';
import 'package:chat_app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepositoryInterface)
class AuthRepository extends AuthRepositoryInterface {
  final AppDatabase database;

  AuthRepository(this.database);

  @override
  Future<void> setupUsers() async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(database.usersTable, [
        UsersTableCompanion(
          id: const Value(1),
          email: Value("case_study@innoscripta.com"),
          password: Value("CaseStudyInnoscripta2025!"),
          firstName: Value("Case Study"),
          lastName: Value("Innoscripta"),
          loginPossible: Value(true),
        ),
        UsersTableCompanion(
          id: const Value(2),
          email: Value("arptumut@gmail.com"),
          password: Value("TestInnoscripta2025!"),
          firstName: Value("Umut"),
          lastName: Value("Arpat"),
          loginPossible: Value(false),
        ),
      ]);
    });

    final result = await database.usersTable.select().get();

    logIt().d("User setup: $result");
  }

  @override
  Future<LoginResult> login(String email, String password) async {
    final user =
        await (database.select(database.usersTable)..where(
              (u) =>
                  u.email.equals(email) &
                  u.password.equals(password) &
                  u.loginPossible.equals(true),
            ))
            .getSingleOrNull();

    if (user == null) return LoginFailure();

    logIt().d("User login: $user");
    return LoginSuccess();
  }

  @override
  Future<ForgotPasswordResult> resetPassword(String email) async {
    final user = await (database.select(
      database.usersTable,
    )..where((u) => u.email.equals(email))).getSingleOrNull();

    if (user == null) return ForgotPasswordUserDoesntExist();

    logIt().d("User reset password: $user");

    return ForgotPasswordSuccess();
  }

  @override
  Future<void> setLoggedIn(bool isLoggedIn) async {
    await database
        .into(database.settingsTable)
        .insertOnConflictUpdate(
          SettingsTableCompanion(
            id: const Value(1),
            isLoggedIn: Value(isLoggedIn),
          ),
        );

    final result = await database.settingsTable.select().getSingle();

    logIt().d("User logged in state has been set on database: $result");
  }

  @override
  Future<SignupResult> signup(
    String firstName,
    String lastName,
    String email,
    String password,
    String accountType,
    String phoneNumber,
  ) async {
    logIt().d(
      "Signing up user: $firstName $lastName $email $password $accountType $phoneNumber",
    );

    final user = await (database.select(
      database.usersTable,
    )..where((u) => u.email.equals(email))).getSingleOrNull();

    if (user != null) return UserAlreadyExists();

    return SignupSuccess();
  }
}
