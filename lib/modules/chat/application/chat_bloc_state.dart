import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bloc_state.freezed.dart';

@freezed
abstract class ChatBlocState with _$ChatBlocState {
  factory ChatBlocState({
    FetchUserResult? fetchUserResult,
    List<UserListModel>? userList,
  }) = _ChatBlocState;
}
