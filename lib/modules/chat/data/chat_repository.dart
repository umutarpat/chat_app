import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/chat/data/models/message_model/message_model.dart';
import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_messages_result.dart';
import 'package:chat_app/modules/chat/domain/entities/send_message_result.dart';
import 'package:chat_app/modules/chat/domain/repositories/chat_repository_interface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepositoryInterface)
class ChatRepository extends ChatRepositoryInterface {
  final AppDatabase database;

  ChatRepository(this.database);

  @override
  Future<FetchUserResult> fetchUserList() async {
    try {
      final result = await (database.select(
        database.usersTable,
      )..where((u) => u.id.equals(2))).get();

      final userList = result
          .map((e) => UserListModel.fromJson(e.toJson()))
          .toList();

      logIt().d("User list: $result");
      return FetchUserSuccess(userList: userList);
    } catch (e) {
      logIt().e("Error fetching user list: $e");
      return FetchUserFailure();
    }
  }

  @override
  Future<SendMessageResult> sendMessage(String message, int receiverId) async {
    try {
      await database
          .into(database.messagesTable)
          .insert(
            MessagesTableCompanion.insert(
              // fixed as it is the only user id can be logged in
              senderId: 1,
              receiverId: receiverId,
              message: message,
            ),
          );
      return SendMessageSuccess();
    } catch (e) {
      logIt().e("Error sending message: $e");
      return SendMessageFailure();
    }
  }

  @override
  Future<GetMessagesResult> getMessages(int receiverId) async {
    try {
      final result = await (database.select(
        database.messagesTable,
      )..where((message) => message.receiverId.equals(receiverId))).get();

      final messages = result
          .map((e) => MessageModel.fromJson(e.toJson()))
          .toList();

      return GetMessagesSuccess(messages: messages);
    } catch (e) {
      logIt().e("Error fetching messages: $e");
      return GetMessagesFailure();
    }
  }
}
