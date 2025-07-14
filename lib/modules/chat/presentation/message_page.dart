import 'package:chat_app/global/domain/entities/routes/message_page_routes_model.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/chat/application/chat_bloc.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_event.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_state.dart';
import 'package:chat_app/modules/chat/domain/entities/join_meeting_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class MessagePage extends StatefulWidget {
  final MessagePageRoutesModel receiverUser;

  const MessagePage({super.key, required this.receiverUser});

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
    ).add(GetMessagesEvent(receiverId: widget.receiverUser.userId));
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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          BlocConsumer<ChatBloc, ChatBlocState>(
            listenWhen: (previous, current) {
              if (previous.joinMeetingResult is! JoinMeetingPermissionError &&
                  current.joinMeetingResult is JoinMeetingPermissionError) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              if (state.joinMeetingResult is JoinMeetingPermissionError) {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      l10n.permissionsNeededTitle,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    content: Text(
                      l10n.micAndCameraPermissionsEnable,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => openAppSettings(),
                        child: Text(
                          l10n.openSettings,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<ChatBloc>().add(
                        JoinMeetingEvent(
                          displayName:
                              "${state.currentLoggedInUser?.firstName} ${state.currentLoggedInUser?.lastName}",
                          email: state.currentLoggedInUser?.email ?? '',
                          isVideoMuted: true,
                        ),
                      );
                    },
                    icon: const Icon(Icons.call),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ChatBloc>().add(
                        JoinMeetingEvent(
                          displayName:
                              "${state.currentLoggedInUser?.firstName} ${state.currentLoggedInUser?.lastName}",
                          email: state.currentLoggedInUser?.email ?? '',
                        ),
                      );
                    },
                    icon: const Icon(Icons.videocam),
                  ),
                ],
              );
            },
          ),
        ],
        centerTitle: false,
        title: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(
            "${widget.receiverUser.firstName} ${widget.receiverUser.lastName}",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            widget.receiverUser.email,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<ChatBloc, ChatBlocState>(
          listener: (context, state) {
            // Scroll to bottom when messages are loaded
            if (state.messages?.isNotEmpty ?? false) {
              _scrollToBottom();
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            context.read<ChatBloc>().add(
                              SendMessageEvent(
                                message:
                                    _formKey.currentState?.value['message'] ??
                                    '',
                                receiverId: widget.receiverUser.userId,
                              ),
                            );
                            // normally you would not call this after sending a message
                            // because you would fetch messages through stream/websocket
                            // but because this is prototype, we will call it here
                            context.read<ChatBloc>().add(
                              GetMessagesEvent(
                                receiverId: widget.receiverUser.userId,
                              ),
                            );
                            context.read<ChatBloc>().add(
                              GetChatsEvent(
                                userId: state.currentLoggedInUser!.id!,
                              ),
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
            );
          },
        ),
      ),
    );
  }
}
