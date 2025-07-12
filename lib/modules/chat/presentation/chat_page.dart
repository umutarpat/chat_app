import 'package:chat_app/global/core/routes.dart';
import 'package:chat_app/global/domain/entities/routes/message_page_routes_model.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/chat/application/chat_bloc.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_event.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_state.dart';
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
    BlocProvider.of<ChatBloc>(context).add(FetchUserListEvent());
    BlocProvider.of<ChatBloc>(context).add(GetChatsEvent(userId: 1));
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
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(
            onPressed: () {
              context.pushNamed('/${AppRoute.settings.name}');
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocBuilder<ChatBloc, ChatBlocState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.chats?.length ?? 0,
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
                      userId: chat?.userId ?? 0,
                      firstName: chat?.firstName ?? '',
                      lastName: chat?.lastName ?? '',
                      email: chat?.email ?? '',
                    ),
                  );
                },
              );
            },
          );
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
    );
  }
}
