import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/chat/data/models/chat_model/chat_model.dart';
import 'package:chat_app/modules/chat/data/models/message_model/message_model.dart';
import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_chats_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_messages_result.dart';
import 'package:chat_app/modules/chat/domain/entities/send_message_result.dart';
import 'package:chat_app/modules/chat/domain/repositories/chat_repository_interface.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepositoryInterface)
class ChatRepository extends ChatRepositoryInterface {
  final AppDatabase database;

  ChatRepository(this.database);

  @override
  Future<GetCurrentLoggedInUserResult> getCurrentLoggedUser() async {
    try {
      final result = await (database.select(
        database.usersTable,
      )..where((u) => u.id.equals(1))).getSingleOrNull();

      if (result == null) {
        return GetCurrentLoggedInUserFailure();
      }

      return GetCurrentLoggedInUserSuccess(
        currentLoggedInUser: UserListModel(
          id: result.id,
          firstName: result.firstName,
          lastName: result.lastName,
          email: result.email,
        ),
      );
    } catch (e) {
      logIt().e("Error fetching current logged user: $e");
      return GetCurrentLoggedInUserFailure();
    }
  }

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

  @override
  Future<GetChatsResult> getChats(int userId) async {
    try {
      // Get users who current user sent messages and users who sent messages to current user.
      final sentToUsers =
          await (database.select(database.messagesTable)
                ..where((message) => message.senderId.equals(userId))
                ..orderBy([(message) => OrderingTerm.desc(message.createdAt)]))
              .get();

      final receivedFromUsers =
          await (database.select(database.messagesTable)
                ..where((message) => message.receiverId.equals(userId))
                ..orderBy([(message) => OrderingTerm.desc(message.createdAt)]))
              .get();

      // Get unique user IDs from both directions
      final Set<int> chatUserIds = {};

      // Add users we sent messages to
      for (final message in sentToUsers) {
        if (message.receiverId != userId) {
          chatUserIds.add(message.receiverId);
        }
      }

      // Add users we received messages from
      for (final message in receivedFromUsers) {
        if (message.senderId != userId) {
          chatUserIds.add(message.senderId);
        }
      }

      final chats = <ChatModel>[];

      for (final chatUserId in chatUserIds) {
        final user =
            await (database.select(database.usersTable)
                  ..where((u) => u.id.equals(chatUserId))
                  ..limit(1))
                .getSingleOrNull();

        if (user != null) {
          // Get the last messages between this user and current user.
          final lastSentMessage =
              await (database.select(database.messagesTable)
                    ..where((message) => message.senderId.equals(userId))
                    ..where((message) => message.receiverId.equals(user.id))
                    ..orderBy([
                      (message) => OrderingTerm.desc(message.createdAt),
                    ])
                    ..limit(1))
                  .getSingleOrNull();

          final lastReceivedMessage =
              await (database.select(database.messagesTable)
                    ..where((message) => message.senderId.equals(user.id))
                    ..where((message) => message.receiverId.equals(userId))
                    ..orderBy([
                      (message) => OrderingTerm.desc(message.createdAt),
                    ])
                    ..limit(1))
                  .getSingleOrNull();

          // compare them to get the last message
          String? lastMessage;
          if (lastSentMessage != null && lastReceivedMessage != null) {
            lastMessage =
                lastSentMessage.createdAt.isAfter(lastReceivedMessage.createdAt)
                ? lastSentMessage.message
                : lastReceivedMessage.message;
          } else if (lastSentMessage != null) {
            lastMessage = lastSentMessage.message;
          } else if (lastReceivedMessage != null) {
            lastMessage = lastReceivedMessage.message;
          }

          chats.add(
            ChatModel(
              userId: user.id,
              firstName: user.firstName,
              lastName: user.lastName,
              email: user.email,
              lastMessage: lastMessage,
            ),
          );
        }
      }

      logIt().d("Chats for user $userId: $chats");
      return GetChatsSuccess(chats: chats);
    } catch (e) {
      logIt().e("Error fetching chats: $e");
      return GetChatsFailure();
    }
  }
}
