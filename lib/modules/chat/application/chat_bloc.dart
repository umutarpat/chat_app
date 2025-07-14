import 'package:chat_app/modules/chat/application/chat_bloc_event.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_state.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_usecase.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_chats_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_messages_result.dart';
import 'package:chat_app/modules/chat/domain/entities/send_message_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ChatBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  final ChatBlocFetchUserListUseCase fetchUserListUseCase;
  final ChatBlocSendMessageUseCase sendMessageUseCase;
  final ChatBlocGetMessagesUseCase getMessagesUseCase;
  final ChatBlocGetChatsUseCase getChatsUseCase;
  final ChatBlocGetCurrentLoggedUserUseCase getCurrentLoggedInUserUseCase;
  final ChatBlocJoinMeetingUseCase joinMeetingUseCase;

  ChatBloc(
    this.fetchUserListUseCase,
    this.sendMessageUseCase,
    this.getMessagesUseCase,
    this.getChatsUseCase,
    this.getCurrentLoggedInUserUseCase,
    this.joinMeetingUseCase,
  ) : super(ChatBlocState()) {
    on<GetCurrentLoggedInUserEvent>((event, emit) async {
      final result = await getCurrentLoggedInUserUseCase.call();
      if (result is GetCurrentLoggedInUserSuccess) {
        emit(
          state.copyWith(
            getCurrentLoggedInUserResult: result,
            currentLoggedInUser: result.currentLoggedInUser,
          ),
        );
      } else {
        emit(state.copyWith(getCurrentLoggedInUserResult: result));
      }
    });
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
    on<JoinMeetingEvent>((event, emit) async {
      final result = await joinMeetingUseCase.call(
        displayName: event.displayName,
        email: event.email,
        isAudioMuted: event.isAudioMuted,
        isVideoMuted: event.isVideoMuted,
      );
      emit(state.copyWith(joinMeetingResult: result));
    });
  }
}
