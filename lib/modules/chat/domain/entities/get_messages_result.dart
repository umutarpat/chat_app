import 'package:chat_app/modules/chat/data/models/message_model/message_model.dart';

sealed class GetMessagesResult {}

final class GetMessagesSuccess extends GetMessagesResult {
  final List<MessageModel> messages;

  GetMessagesSuccess({required this.messages});
}

final class GetMessagesFailure extends GetMessagesResult {}
