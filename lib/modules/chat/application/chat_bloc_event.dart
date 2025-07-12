sealed class ChatBlocEvent {}

final class FetchUserListEvent extends ChatBlocEvent {}

final class SendMessageEvent extends ChatBlocEvent {
  final String message;
  final int receiverId;

  SendMessageEvent({required this.message, required this.receiverId});
}

final class GetMessagesEvent extends ChatBlocEvent {
  final int receiverId;

  GetMessagesEvent({required this.receiverId});
}
