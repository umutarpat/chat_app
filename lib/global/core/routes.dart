import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/injection/injection.dart';
import 'package:chat_app/modules/auth/application/auth_bloc.dart';
import 'package:chat_app/modules/auth/presentation/pages/forgot_password.dart';
import 'package:chat_app/modules/auth/presentation/pages/login_page.dart';
import 'package:chat_app/modules/auth/presentation/pages/signup/signup_page.dart';
import 'package:chat_app/modules/chat/presentation/chat_page.dart';
import 'package:chat_app/modules/settings/application/settings_bloc.dart';
import 'package:chat_app/modules/settings/presentation/settings_page.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { login, forgotPassword, chat, settings, signup }

final router = GoRouter(
  initialLocation: '/${AppRoute.login.name}',
  redirect: (context, state) async {
    final database = getIt<AppDatabase>();

    final result = await database.settingsTable.select().getSingleOrNull();

    if (result == null) {
      return "/${AppRoute.login.name}";
    }

    // if user is logged in and starts from login page (when opens the app) route user to chat page
    if (result.isLoggedIn && state.fullPath == '/${AppRoute.login.name}') {
      return '/${AppRoute.chat.name}';
    }
    return state.fullPath;
  },
  routes: [
    GoRoute(
      path: '/${AppRoute.login.name}',
      name: '/${AppRoute.login.name}',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: LoginPage(),
      ),
    ),
    GoRoute(
      path: '/${AppRoute.forgotPassword.name}',
      name: '/${AppRoute.forgotPassword.name}',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: ForgotPasswordPage(),
      ),
    ),
    GoRoute(
      path: '/${AppRoute.signup.name}',
      name: '/${AppRoute.signup.name}',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: SignupPage(),
      ),
    ),
    GoRoute(
      path: '/${AppRoute.chat.name}',
      name: '/${AppRoute.chat.name}',
      builder: (context, state) => ChatPage(),
    ),
    GoRoute(
      path: '/${AppRoute.settings.name}',
      name: '/${AppRoute.settings.name}',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SettingsBloc>(),
        child: SettingsPage(),
      ),
    ),
  ],
);
