import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class MessagePage extends StatelessWidget {
  final UserListModel user;

  const MessagePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Text('Message'),
            Spacer(),
            FormBuilderTextField(
              name: 'message',
              decoration: InputDecoration(
                hintText: 'Message',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
