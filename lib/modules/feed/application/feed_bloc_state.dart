import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:chat_app/modules/feed/data/models/feed_post_model/feed_post_model.dart';
import 'package:chat_app/modules/feed/domain/entities/create_post_result.dart';
import 'package:chat_app/modules/feed/domain/entities/get_posts_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_bloc_state.freezed.dart';

@freezed
abstract class FeedBlocState with _$FeedBlocState {
  factory FeedBlocState({
    GetPostsResult? getPostsResult,
    List<FeedPostModel>? posts,
    CreatePostResult? createPostResult,
    GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    UserListModel? currentLoggedInUser,
  }) = _FeedBlocState;
}
