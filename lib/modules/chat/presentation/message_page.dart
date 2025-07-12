import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/chat/application/chat_bloc.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_event.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_state.dart';
import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class MessagePage extends StatefulWidget {
  final UserListModel user;
  const MessagePage({super.key, required this.user});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatBloc>(
      context,
    ).add(GetMessagesEvent(receiverId: widget.user.id!));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: false,
        title: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(
            "${user.firstName} ${user.lastName}",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            user.email ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatBloc, ChatBlocState>(
                listener: (context, state) {
                  // Scroll to bottom when messages are loaded
                  if (state.messages?.isNotEmpty ?? false) {
                    _scrollToBottom();
                  }
                },

                builder: (context, state) {
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: state.messages?.length ?? 0,
                    itemBuilder: (context, index) {
                      final message = state.messages?[index];
                      final isSender =
                          message?.senderId ==
                          1; // 1 is always sender because only user can login is user id 1

                      return Align(
                        alignment: isSender
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSender
                                ? Theme.of(context).primaryColor
                                : Colors.orange,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            message?.message ?? '',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  fontSize: 14,
                                  color: isSender
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            FormBuilder(
              key: _formKey,
              child: FormBuilderTextField(
                name: 'message',
                validator: FormBuilderValidators.required(
                  errorText: l10n.cannotBeEmpty,
                ),
                decoration: InputDecoration(
                  hintText: l10n.message,
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (user.id == null) {
                        return;
                      }

                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        context.read<ChatBloc>().add(
                          SendMessageEvent(
                            message:
                                _formKey.currentState?.value['message'] ?? '',
                            receiverId: user.id!,
                          ),
                        );
                        // normally you would not call this after sending a message
                        // because you would fetch messages through stream/websocket
                        // but because this is prototype, we will call it here
                        context.read<ChatBloc>().add(
                          GetMessagesEvent(receiverId: user.id!),
                        );
                        _formKey.currentState?.reset();
                        FocusScope.of(context).unfocus();
                      }
                    },
                    icon: Icon(Icons.send),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
