import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/feed/application/feed_bloc_event.dart';
import 'package:chat_app/modules/feed/application/feed_bloc_state.dart';
import 'package:chat_app/modules/feed/application/feed_bloc_usecase.dart';
import 'package:chat_app/modules/feed/domain/entities/create_post_result.dart';
import 'package:chat_app/modules/feed/domain/entities/get_posts_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FeedBloc extends Bloc<FeedBlocEvent, FeedBlocState> {
  final FeedBlocGetFeedUseCase getFeedUseCase;
  final FeedBlocCreatePostUseCase createPostUseCase;
  final FeedBlocGetCurrentLoggedUserUseCase getCurrentLoggedUserUseCase;

  FeedBloc({
    required this.getFeedUseCase,
    required this.createPostUseCase,
    required this.getCurrentLoggedUserUseCase,
  }) : super(FeedBlocState()) {
    on<GetFeedEvent>((event, emit) async {
      final result = await getFeedUseCase.call();
      if (result is GetPostsSuccess) {
        emit(state.copyWith(getPostsResult: result, posts: result.posts));
      } else {
        emit(state.copyWith(getPostsResult: result));
      }
    });

    on<CreatePostEvent>((event, emit) async {
      final result = await createPostUseCase.call(
        title: event.title,
        description: event.description,
        imagePath: event.imagePath,
        userId: event.userId,
        firstName: event.firstName,
        lastName: event.lastName,
      );

      if (result is CreatePostSuccess) {
        emit(state.copyWith(createPostResult: result));
        // Refresh the feed after creating a post
        add(GetFeedEvent());
      } else {
        emit(state.copyWith(createPostResult: result));
      }
    });
    on<GetCurrentLoggedInUserEvent>((event, emit) async {
      final result = await getCurrentLoggedUserUseCase.call();
      if (result is GetCurrentLoggedInUserSuccess) {
        emit(
          state.copyWith(
            getCurrentLoggedInUserResult: result,
            currentLoggedInUser: result.currentLoggedInUser,
          ),
        );
      } else {
        emit(state.copyWith(getCurrentLoggedInUserResult: result));
      }
    });
  }
}
