import 'package:chat_app/modules/feed/data/models/feed_post_model/feed_post_model.dart';

sealed class GetPostsResult {}

final class GetPostsSuccess extends GetPostsResult {
  final List<FeedPostModel> posts;

  GetPostsSuccess({required this.posts});
}

final class GetPostsFailure extends GetPostsResult {}
