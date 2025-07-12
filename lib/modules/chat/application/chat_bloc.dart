import 'package:chat_app/modules/chat/application/chat_bloc_event.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_state.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_usecase.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_chats_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_messages_result.dart';
import 'package:chat_app/modules/chat/domain/entities/send_message_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class ChatBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  final ChatBlocFetchUserListUseCase fetchUserListUseCase;
  final ChatBlocSendMessageUseCase sendMessageUseCase;
  final ChatBlocGetMessagesUseCase getMessagesUseCase;
  final ChatBlocGetChatsUseCase getChatsUseCase;

  ChatBloc(
    this.fetchUserListUseCase,
    this.sendMessageUseCase,
    this.getMessagesUseCase,
    this.getChatsUseCase,
  ) : super(ChatBlocState()) {
    on<FetchUserListEvent>((event, emit) async {
      final result = await fetchUserListUseCase.call();

      if (result is FetchUserSuccess) {
        emit(
          state.copyWith(fetchUserResult: result, userList: result.userList),
        );
      } else {
        emit(state.copyWith(fetchUserResult: result));
      }
    });
    on<SendMessageEvent>((event, emit) async {
      final result = await sendMessageUseCase.call(
        event.message,
        event.receiverId,
      );

      if (result is SendMessageSuccess) {
        emit(state.copyWith(sendMessageResult: result));
      } else {
        emit(state.copyWith(sendMessageResult: result));
      }
    });
    on<GetMessagesEvent>((event, emit) async {
      final result = await getMessagesUseCase.call(event.receiverId);
      if (result is GetMessagesSuccess) {
        emit(
          state.copyWith(getMessagesResult: result, messages: result.messages),
        );
      } else {
        emit(state.copyWith(getMessagesResult: result));
      }
    });
    on<GetChatsEvent>((event, emit) async {
      final result = await getChatsUseCase.call(event.userId);
      if (result is GetChatsSuccess) {
        emit(state.copyWith(getChatsResult: result, chats: result.chats));
      } else {
        emit(state.copyWith(getChatsResult: result));
      }
    });
  }
}
