import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:chat_app/modules/feed/data/models/feed_post_model/feed_post_model.dart';
import 'package:chat_app/modules/feed/domain/entities/create_post_result.dart';
import 'package:chat_app/modules/feed/domain/entities/get_posts_result.dart';
import 'package:chat_app/modules/feed/domain/repositories/feed_repository_interface.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FeedRepositoryInterface)
class FeedRepository extends FeedRepositoryInterface {
  final AppDatabase database;

  FeedRepository(this.database);

  @override
  Future<GetPostsResult> getFeed() async {
    try {
      final result = await (database.select(
        database.postsTable,
      )..orderBy([(post) => OrderingTerm.desc(post.createdAt)])).get();

      final posts = result
          .map((e) => FeedPostModel.fromJson(e.toJson()))
          .toList();

      logIt().d("Posts fetched: $posts");
      return GetPostsSuccess(posts: posts);
    } catch (e) {
      logIt().e("Error fetching posts: $e");
      return GetPostsFailure();
    }
  }

  @override
  Future<CreatePostResult> createPost({
    required String title,
    required String description,
    String? imagePath,
    required int userId,
    required String firstName,
    required String lastName,
  }) async {
    try {
      await database
          .into(database.postsTable)
          .insert(
            PostsTableCompanion.insert(
              title: title,
              description: description,
              imagePath: Value(imagePath),
              userId: userId,
              firstName: firstName,
              lastName: lastName,
            ),
          );

      logIt().d("Post created successfully");
      return CreatePostSuccess();
    } catch (e) {
      logIt().e("Error creating post: $e");
      return CreatePostFailure();
    }
  }

  @override
  Future<GetCurrentLoggedInUserResult> getCurrentLoggedUser() async {
    try {
      final result = await (database.select(
        database.usersTable,
      )..where((u) => u.id.equals(1))).getSingleOrNull();

      if (result == null) {
        return GetCurrentLoggedInUserFailure();
      }

      return GetCurrentLoggedInUserSuccess(
        currentLoggedInUser: UserListModel(
          id: result.id,
          firstName: result.firstName,
          lastName: result.lastName,
          email: result.email,
        ),
      );
    } catch (e) {
      logIt().e("Error fetching current logged user: $e");
      return GetCurrentLoggedInUserFailure();
    }
  }
}
