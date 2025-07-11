import 'package:chat_app/modules/auth/presentation/pages/forgot_password.dart';
import 'package:chat_app/modules/auth/presentation/pages/login_page.dart';
import 'package:chat_app/modules/chat/presentation/chat_page.dart';
import 'package:chat_app/modules/settings/presentation/settings_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { login, forgotPassword, chat, settings }

final router = GoRouter(
  initialLocation: '/${AppRoute.chat.name}',
  routes: [
    GoRoute(
      path: '/${AppRoute.login.name}',
      name: '/${AppRoute.login.name}',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/${AppRoute.forgotPassword.name}',
      name: '/${AppRoute.forgotPassword.name}',
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/${AppRoute.chat.name}',
      name: '/${AppRoute.chat.name}',
      builder: (context, state) => ChatPage(),
    ),
    GoRoute(
      path: '/${AppRoute.settings.name}',
      name: '/${AppRoute.settings.name}',
      builder: (context, state) => SettingsPage(),
    ),
  ],
);
