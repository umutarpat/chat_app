import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_bloc_state.freezed.dart';

@freezed
abstract class FeedBlocState with _$FeedBlocState {
  factory FeedBlocState({String? getFeedResult}) = _FeedBlocState;
}
