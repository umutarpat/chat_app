import 'package:chat_app/global/core/routes.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({required this.currentIndex, super.key});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        context.go('/${AppRoute.chat.name}');
        break;
      case 1:
        context.go('/${AppRoute.feed.name}');
        break;
      case 2:
        context.go('/${AppRoute.todo.name}');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onTap(context, index),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: l10n.chat),
        BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: l10n.feed),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: l10n.todo),
      ],
    );
  }
}
