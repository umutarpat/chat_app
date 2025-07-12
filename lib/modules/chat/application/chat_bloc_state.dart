import 'package:chat_app/modules/chat/data/models/message_model/message_model.dart';
import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_messages_result.dart';
import 'package:chat_app/modules/chat/domain/entities/send_message_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bloc_state.freezed.dart';

@freezed
abstract class ChatBlocState with _$ChatBlocState {
  factory ChatBlocState({
    FetchUserResult? fetchUserResult,
    List<UserListModel>? userList,
    SendMessageResult? sendMessageResult,
    GetMessagesResult? getMessagesResult,
    List<MessageModel>? messages,
  }) = _ChatBlocState;
}
