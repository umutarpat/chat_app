import 'package:chat_app/global/common/bottom_nav_bar.dart';
import 'package:chat_app/global/core/routes.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.feed,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,

        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed('/${AppRoute.settings.name}');
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(child: Text("Feed")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //final chatBloc = context.read<ChatBloc>();

          /* showModalBottomSheet(
            context: context,
            builder: (bottomSheetContext) {
              return BlocProvider.value(
                value: chatBloc,
                child: const ChatPageNewChatSheet(),
              );
            },
          ); */
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
