import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_chats_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_messages_result.dart';
import 'package:chat_app/modules/chat/domain/entities/send_message_result.dart';
import 'package:chat_app/modules/chat/domain/repositories/chat_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatBlocFetchUserListUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocFetchUserListUseCase(this.repository);

  Future<FetchUserResult> call() async {
    return await repository.fetchUserList();
  }
}

@injectable
class ChatBlocSendMessageUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocSendMessageUseCase(this.repository);

  Future<SendMessageResult> call(String message, int receiverId) async {
    return await repository.sendMessage(message, receiverId);
  }
}

@injectable
class ChatBlocGetMessagesUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocGetMessagesUseCase(this.repository);

  Future<GetMessagesResult> call(int receiverId) async {
    return await repository.getMessages(receiverId);
  }
}

@injectable
class ChatBlocGetChatsUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocGetChatsUseCase(this.repository);

  Future<GetChatsResult> call(int userId) async {
    return await repository.getChats(userId);
  }
}
