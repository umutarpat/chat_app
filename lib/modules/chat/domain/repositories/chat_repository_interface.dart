import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_chats_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_messages_result.dart';
import 'package:chat_app/modules/chat/domain/entities/send_message_result.dart';

abstract class ChatRepositoryInterface {
  Future<GetCurrentLoggedInUserResult> getCurrentLoggedUser();

  Future<FetchUserResult> fetchUserList();

  Future<SendMessageResult> sendMessage(String message, int receiverId);

  Future<GetMessagesResult> getMessages(int receiverId);

  Future<GetChatsResult> getChats(int userId);
}
