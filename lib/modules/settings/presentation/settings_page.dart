import 'package:chat_app/global/core/routes.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/settings/application/settings_bloc.dart';
import 'package:chat_app/modules/settings/application/settings_bloc_event.dart';
import 'package:chat_app/modules/settings/application/settings_bloc_state.dart';
import 'package:chat_app/modules/settings/domain/entities/logout_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<SettingsBloc, SettingsBlocState>(
            listener: (context, state) {
              if (state.logoutResult is LogoutSuccess) {
                context.goNamed('/${AppRoute.login.name}');
              }
            },
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    l10n.logout,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  onTap: () {
                    context.read<SettingsBloc>().add(
                      LogoutEvent(isLoggedIn: false),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
