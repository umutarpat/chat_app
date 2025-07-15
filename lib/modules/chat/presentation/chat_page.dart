import 'package:chat_app/global/common/bottom_nav_bar.dart';
import 'package:chat_app/global/core/routes.dart';
import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/global/domain/entities/routes/message_page_routes_model.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/chat/application/chat_bloc.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_event.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_state.dart';
import 'package:chat_app/modules/chat/domain/entities/get_chats_result.dart';
import 'package:chat_app/modules/chat/presentation/widgets/new_chat_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatBloc>(context).add(GetCurrentLoggedInUserEvent());
    BlocProvider.of<ChatBloc>(context).add(FetchUserListEvent());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.chat,
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
      body: BlocConsumer<ChatBloc, ChatBlocState>(
        listenWhen: (previous, current) {
          if (previous.getCurrentLoggedInUserResult
                  is! GetCurrentLoggedInUserSuccess &&
              current.getCurrentLoggedInUserResult
                  is GetCurrentLoggedInUserSuccess) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if (state.getCurrentLoggedInUserResult
              is GetCurrentLoggedInUserSuccess) {
            context.read<ChatBloc>().add(
              GetChatsEvent(userId: state.currentLoggedInUser!.id!),
            );
          }
        },
        builder: (context, state) {
          if (state.getChatsResult is GetChatsSuccess) {
            final chats = state.chats ?? [];

            if (chats.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.noChatsYet,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ChatBloc>().add(
                  GetChatsEvent(userId: state.currentLoggedInUser!.id!),
                );
              },
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = state.chats?[index];
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(
                      "${chat?.firstName} ${chat?.lastName}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      chat?.lastMessage ?? '',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    onTap: () {
                      context.pushNamed(
                        '/${AppRoute.message.name}',
                        extra: MessagePageRoutesModel(
                          userId: chat!.userId!,
                          firstName: chat.firstName ?? '',
                          lastName: chat.lastName ?? '',
                          email: chat.email ?? '',
                        ),
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final chatBloc = context.read<ChatBloc>();

          showModalBottomSheet(
            context: context,
            builder: (bottomSheetContext) {
              return BlocProvider.value(
                value: chatBloc,
                child: const ChatPageNewChatSheet(),
              );
            },
          );
        },
        child: Icon(Icons.chat),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
