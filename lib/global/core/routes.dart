import 'package:chat_app/modules/auth/presentation/pages/forgot_password.dart';
import 'package:chat_app/modules/auth/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { login, forgotPassword }

final router = GoRouter(
  initialLocation: '/${AppRoute.login.name}',
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
  ],
);
