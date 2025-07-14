import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/feed/domain/entities/create_post_result.dart';
import 'package:chat_app/modules/feed/domain/entities/get_posts_result.dart';

abstract class FeedRepositoryInterface {
  Future<GetPostsResult> getFeed();
  Future<CreatePostResult> createPost({
    required String title,
    required String description,
    String? imagePath,
    required int userId,
    required String firstName,
    required String lastName,
  });

  Future<GetCurrentLoggedInUserResult> getCurrentLoggedUser();
}
