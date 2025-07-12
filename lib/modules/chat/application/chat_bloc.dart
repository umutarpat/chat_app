import 'package:chat_app/modules/chat/application/chat_bloc_event.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_state.dart';
import 'package:chat_app/modules/chat/application/chat_bloc_usecase.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  final ChatBlocFetchUserListUseCase fetchUserListUseCase;

  ChatBloc(this.fetchUserListUseCase) : super(ChatBlocState()) {
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
  }
}
