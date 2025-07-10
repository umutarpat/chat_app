import 'package:chat_app/modules/auth/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: '/login',
      builder: (context, state) => LoginPage(),
    ),
  ],
);
