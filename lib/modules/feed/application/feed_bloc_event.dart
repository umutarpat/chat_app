sealed class FeedBlocEvent {}

final class GetFeedEvent extends FeedBlocEvent {}

final class CreatePostEvent extends FeedBlocEvent {
  final String title;
  final String description;
  final String? imagePath;
  final int userId;
  final String firstName;
  final String lastName;

  CreatePostEvent({
    required this.title,
    required this.description,
    this.imagePath,
    required this.userId,
    required this.firstName,
    required this.lastName,
  });
}

final class GetCurrentLoggedInUserEvent extends FeedBlocEvent {}
