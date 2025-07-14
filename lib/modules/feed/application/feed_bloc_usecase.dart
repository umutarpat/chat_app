import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/feed/domain/entities/create_post_result.dart';
import 'package:chat_app/modules/feed/domain/entities/get_posts_result.dart';
import 'package:chat_app/modules/feed/domain/repositories/feed_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class FeedBlocGetFeedUseCase {
  final FeedRepositoryInterface repository;

  FeedBlocGetFeedUseCase(this.repository);

  Future<GetPostsResult> call() async {
    return await repository.getFeed();
  }
}

@injectable
class FeedBlocCreatePostUseCase {
  final FeedRepositoryInterface repository;

  FeedBlocCreatePostUseCase(this.repository);

  Future<CreatePostResult> call({
    required String title,
    required String description,
    String? imagePath,
    required int userId,
    required String firstName,
    required String lastName,
  }) async {
    return await repository.createPost(
      title: title,
      description: description,
      imagePath: imagePath,
      userId: userId,
      firstName: firstName,
      lastName: lastName,
    );
  }
}

@injectable
class FeedBlocGetCurrentLoggedUserUseCase {
  final FeedRepositoryInterface repository;

  FeedBlocGetCurrentLoggedUserUseCase(this.repository);

  Future<GetCurrentLoggedInUserResult> call() async {
    return await repository.getCurrentLoggedUser();
  }
}
