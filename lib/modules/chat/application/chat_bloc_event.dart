sealed class ChatBlocEvent {}

final class FetchUserListEvent extends ChatBlocEvent {}

final class GetCurrentLoggedInUserEvent extends ChatBlocEvent {}

final class SendMessageEvent extends ChatBlocEvent {
  final String message;
  final int receiverId;

  SendMessageEvent({required this.message, required this.receiverId});
}

final class GetMessagesEvent extends ChatBlocEvent {
  final int receiverId;

  GetMessagesEvent({required this.receiverId});
}

final class GetChatsEvent extends ChatBlocEvent {
  final int userId;

  GetChatsEvent({required this.userId});
}

final class JoinMeetingEvent extends ChatBlocEvent {
  final String displayName;
  final String email;
  final bool isAudioMuted;
  final bool isVideoMuted;

  JoinMeetingEvent({
    required this.displayName,
    required this.email,
    this.isAudioMuted = false,
    this.isVideoMuted = false,
  });
}
