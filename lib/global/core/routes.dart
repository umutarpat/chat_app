import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/domain/entities/routes/message_page_routes_model.dart';
import 'package:chat_app/global/injection/injection.dart';
import 'package:chat_app/modules/auth/application/auth_bloc.dart';
import 'package:chat_app/modules/auth/presentation/pages/forgot_password.dart';
import 'package:chat_app/modules/auth/presentation/pages/login_page.dart';
import 'package:chat_app/modules/auth/presentation/pages/signup/signup_page.dart';
import 'package:chat_app/modules/chat/application/chat_bloc.dart';
import 'package:chat_app/modules/chat/presentation/chat_page.dart';
import 'package:chat_app/modules/chat/presentation/message_page.dart';
import 'package:chat_app/modules/feed/application/feed_bloc.dart';
import 'package:chat_app/modules/feed/presentation/feed_page.dart';
import 'package:chat_app/modules/settings/application/settings_bloc.dart';
import 'package:chat_app/modules/settings/presentation/settings_page.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { login, forgotPassword, chat, settings, signup, message, feed }

final router = GoRouter(
  initialLocation: '/${AppRoute.login.name}',
  redirect: (context, state) async {
    final database = getIt<AppDatabase>();

    final result = await database.settingsTable.select().getSingleOrNull();

    // if there is no settings table yet, that means user didn't login yet, continue with default route
    if (result == null) {
      return state.fullPath;
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
      pageBuilder: (context, state) => NoTransitionPage(
        child: BlocProvider.value(value: getIt<ChatBloc>(), child: ChatPage()),
      ),
    ),
    GoRoute(
      path: '/${AppRoute.message.name}',
      name: '/${AppRoute.message.name}',
      builder: (context, state) {
        final extra = state.extra as MessagePageRoutesModel;
        return BlocProvider.value(
          value: getIt<ChatBloc>(),
          child: MessagePage(receiverUser: extra),
        );
      },
    ),
    GoRoute(
      path: '/${AppRoute.settings.name}',
      name: '/${AppRoute.settings.name}',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SettingsBloc>(),
        child: SettingsPage(),
      ),
    ),
    GoRoute(
      path: '/${AppRoute.feed.name}',
      name: '/${AppRoute.feed.name}',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BlocProvider(
          create: (context) => getIt<FeedBloc>(),
          child: FeedPage(),
        ),
      ),
    ),
  ],
);
