import 'package:chat_app/modules/chat/data/models/chat_model/chat_model.dart';

abstract class GetChatsResult {}

class GetChatsSuccess extends GetChatsResult {
  final List<ChatModel> chats;

  GetChatsSuccess({required this.chats});
}

class GetChatsFailure extends GetChatsResult {}
