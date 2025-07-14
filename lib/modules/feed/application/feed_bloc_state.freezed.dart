// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FeedBlocState {
  GetPostsResult? get getPostsResult => throw _privateConstructorUsedError;
  List<FeedPostModel>? get posts => throw _privateConstructorUsedError;
  CreatePostResult? get createPostResult => throw _privateConstructorUsedError;
  GetCurrentLoggedInUserResult? get getCurrentLoggedInUserResult =>
      throw _privateConstructorUsedError;
  UserListModel? get currentLoggedInUser => throw _privateConstructorUsedError;

  /// Create a copy of FeedBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedBlocStateCopyWith<FeedBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedBlocStateCopyWith<$Res> {
  factory $FeedBlocStateCopyWith(
    FeedBlocState value,
    $Res Function(FeedBlocState) then,
  ) = _$FeedBlocStateCopyWithImpl<$Res, FeedBlocState>;
  @useResult
  $Res call({
    GetPostsResult? getPostsResult,
    List<FeedPostModel>? posts,
    CreatePostResult? createPostResult,
    GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    UserListModel? currentLoggedInUser,
  });

  $UserListModelCopyWith<$Res>? get currentLoggedInUser;
}

/// @nodoc
class _$FeedBlocStateCopyWithImpl<$Res, $Val extends FeedBlocState>
    implements $FeedBlocStateCopyWith<$Res> {
  _$FeedBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getPostsResult = freezed,
    Object? posts = freezed,
    Object? createPostResult = freezed,
    Object? getCurrentLoggedInUserResult = freezed,
    Object? currentLoggedInUser = freezed,
  }) {
    return _then(
      _value.copyWith(
            getPostsResult: freezed == getPostsResult
                ? _value.getPostsResult
                : getPostsResult // ignore: cast_nullable_to_non_nullable
                      as GetPostsResult?,
            posts: freezed == posts
                ? _value.posts
                : posts // ignore: cast_nullable_to_non_nullable
                      as List<FeedPostModel>?,
            createPostResult: freezed == createPostResult
                ? _value.createPostResult
                : createPostResult // ignore: cast_nullable_to_non_nullable
                      as CreatePostResult?,
            getCurrentLoggedInUserResult:
                freezed == getCurrentLoggedInUserResult
                ? _value.getCurrentLoggedInUserResult
                : getCurrentLoggedInUserResult // ignore: cast_nullable_to_non_nullable
                      as GetCurrentLoggedInUserResult?,
            currentLoggedInUser: freezed == currentLoggedInUser
                ? _value.currentLoggedInUser
                : currentLoggedInUser // ignore: cast_nullable_to_non_nullable
                      as UserListModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of FeedBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserListModelCopyWith<$Res>? get currentLoggedInUser {
    if (_value.currentLoggedInUser == null) {
      return null;
    }

    return $UserListModelCopyWith<$Res>(_value.currentLoggedInUser!, (value) {
      return _then(_value.copyWith(currentLoggedInUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedBlocStateImplCopyWith<$Res>
    implements $FeedBlocStateCopyWith<$Res> {
  factory _$$FeedBlocStateImplCopyWith(
    _$FeedBlocStateImpl value,
    $Res Function(_$FeedBlocStateImpl) then,
  ) = __$$FeedBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    GetPostsResult? getPostsResult,
    List<FeedPostModel>? posts,
    CreatePostResult? createPostResult,
    GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    UserListModel? currentLoggedInUser,
  });

  @override
  $UserListModelCopyWith<$Res>? get currentLoggedInUser;
}

/// @nodoc
class __$$FeedBlocStateImplCopyWithImpl<$Res>
    extends _$FeedBlocStateCopyWithImpl<$Res, _$FeedBlocStateImpl>
    implements _$$FeedBlocStateImplCopyWith<$Res> {
  __$$FeedBlocStateImplCopyWithImpl(
    _$FeedBlocStateImpl _value,
    $Res Function(_$FeedBlocStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getPostsResult = freezed,
    Object? posts = freezed,
    Object? createPostResult = freezed,
    Object? getCurrentLoggedInUserResult = freezed,
    Object? currentLoggedInUser = freezed,
  }) {
    return _then(
      _$FeedBlocStateImpl(
        getPostsResult: freezed == getPostsResult
            ? _value.getPostsResult
            : getPostsResult // ignore: cast_nullable_to_non_nullable
                  as GetPostsResult?,
        posts: freezed == posts
            ? _value._posts
            : posts // ignore: cast_nullable_to_non_nullable
                  as List<FeedPostModel>?,
        createPostResult: freezed == createPostResult
            ? _value.createPostResult
            : createPostResult // ignore: cast_nullable_to_non_nullable
                  as CreatePostResult?,
        getCurrentLoggedInUserResult: freezed == getCurrentLoggedInUserResult
            ? _value.getCurrentLoggedInUserResult
            : getCurrentLoggedInUserResult // ignore: cast_nullable_to_non_nullable
                  as GetCurrentLoggedInUserResult?,
        currentLoggedInUser: freezed == currentLoggedInUser
            ? _value.currentLoggedInUser
            : currentLoggedInUser // ignore: cast_nullable_to_non_nullable
                  as UserListModel?,
      ),
    );
  }
}

/// @nodoc

class _$FeedBlocStateImpl implements _FeedBlocState {
  _$FeedBlocStateImpl({
    this.getPostsResult,
    final List<FeedPostModel>? posts,
    this.createPostResult,
    this.getCurrentLoggedInUserResult,
    this.currentLoggedInUser,
  }) : _posts = posts;

  @override
  final GetPostsResult? getPostsResult;
  final List<FeedPostModel>? _posts;
  @override
  List<FeedPostModel>? get posts {
    final value = _posts;
    if (value == null) return null;
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CreatePostResult? createPostResult;
  @override
  final GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult;
  @override
  final UserListModel? currentLoggedInUser;

  @override
  String toString() {
    return 'FeedBlocState(getPostsResult: $getPostsResult, posts: $posts, createPostResult: $createPostResult, getCurrentLoggedInUserResult: $getCurrentLoggedInUserResult, currentLoggedInUser: $currentLoggedInUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedBlocStateImpl &&
            (identical(other.getPostsResult, getPostsResult) ||
                other.getPostsResult == getPostsResult) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.createPostResult, createPostResult) ||
                other.createPostResult == createPostResult) &&
            (identical(
                  other.getCurrentLoggedInUserResult,
                  getCurrentLoggedInUserResult,
                ) ||
                other.getCurrentLoggedInUserResult ==
                    getCurrentLoggedInUserResult) &&
            (identical(other.currentLoggedInUser, currentLoggedInUser) ||
                other.currentLoggedInUser == currentLoggedInUser));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    getPostsResult,
    const DeepCollectionEquality().hash(_posts),
    createPostResult,
    getCurrentLoggedInUserResult,
    currentLoggedInUser,
  );

  /// Create a copy of FeedBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedBlocStateImplCopyWith<_$FeedBlocStateImpl> get copyWith =>
      __$$FeedBlocStateImplCopyWithImpl<_$FeedBlocStateImpl>(this, _$identity);
}

abstract class _FeedBlocState implements FeedBlocState {
  factory _FeedBlocState({
    final GetPostsResult? getPostsResult,
    final List<FeedPostModel>? posts,
    final CreatePostResult? createPostResult,
    final GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    final UserListModel? currentLoggedInUser,
  }) = _$FeedBlocStateImpl;

  @override
  GetPostsResult? get getPostsResult;
  @override
  List<FeedPostModel>? get posts;
  @override
  CreatePostResult? get createPostResult;
  @override
  GetCurrentLoggedInUserResult? get getCurrentLoggedInUserResult;
  @override
  UserListModel? get currentLoggedInUser;

  /// Create a copy of FeedBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedBlocStateImplCopyWith<_$FeedBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
