import 'package:chat_app/global/core/routes.dart';
import 'package:chat_app/global/themes/light/light_theme.dart';
import 'package:chat_app/injection.dart';
import 'package:chat_app/modules/auth/application/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<AuthBloc>())],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Clusterix Chat App',
        theme: lightTheme(context),
        builder: (context, widget) {
          return GestureDetector(
            onTap: () {
              // makes keyboards go away when tapping outside of text fields
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            },
            child: widget!,
          );
        },
      ),
    );
  }
}
