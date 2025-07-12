// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatBlocState {
  FetchUserResult? get fetchUserResult => throw _privateConstructorUsedError;
  List<UserListModel>? get userList => throw _privateConstructorUsedError;

  /// Create a copy of ChatBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatBlocStateCopyWith<ChatBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBlocStateCopyWith<$Res> {
  factory $ChatBlocStateCopyWith(
    ChatBlocState value,
    $Res Function(ChatBlocState) then,
  ) = _$ChatBlocStateCopyWithImpl<$Res, ChatBlocState>;
  @useResult
  $Res call({FetchUserResult? fetchUserResult, List<UserListModel>? userList});
}

/// @nodoc
class _$ChatBlocStateCopyWithImpl<$Res, $Val extends ChatBlocState>
    implements $ChatBlocStateCopyWith<$Res> {
  _$ChatBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fetchUserResult = freezed, Object? userList = freezed}) {
    return _then(
      _value.copyWith(
            fetchUserResult: freezed == fetchUserResult
                ? _value.fetchUserResult
                : fetchUserResult // ignore: cast_nullable_to_non_nullable
                      as FetchUserResult?,
            userList: freezed == userList
                ? _value.userList
                : userList // ignore: cast_nullable_to_non_nullable
                      as List<UserListModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatBlocStateImplCopyWith<$Res>
    implements $ChatBlocStateCopyWith<$Res> {
  factory _$$ChatBlocStateImplCopyWith(
    _$ChatBlocStateImpl value,
    $Res Function(_$ChatBlocStateImpl) then,
  ) = __$$ChatBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FetchUserResult? fetchUserResult, List<UserListModel>? userList});
}

/// @nodoc
class __$$ChatBlocStateImplCopyWithImpl<$Res>
    extends _$ChatBlocStateCopyWithImpl<$Res, _$ChatBlocStateImpl>
    implements _$$ChatBlocStateImplCopyWith<$Res> {
  __$$ChatBlocStateImplCopyWithImpl(
    _$ChatBlocStateImpl _value,
    $Res Function(_$ChatBlocStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fetchUserResult = freezed, Object? userList = freezed}) {
    return _then(
      _$ChatBlocStateImpl(
        fetchUserResult: freezed == fetchUserResult
            ? _value.fetchUserResult
            : fetchUserResult // ignore: cast_nullable_to_non_nullable
                  as FetchUserResult?,
        userList: freezed == userList
            ? _value._userList
            : userList // ignore: cast_nullable_to_non_nullable
                  as List<UserListModel>?,
      ),
    );
  }
}

/// @nodoc

class _$ChatBlocStateImpl implements _ChatBlocState {
  _$ChatBlocStateImpl({
    this.fetchUserResult,
    final List<UserListModel>? userList,
  }) : _userList = userList;

  @override
  final FetchUserResult? fetchUserResult;
  final List<UserListModel>? _userList;
  @override
  List<UserListModel>? get userList {
    final value = _userList;
    if (value == null) return null;
    if (_userList is EqualUnmodifiableListView) return _userList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChatBlocState(fetchUserResult: $fetchUserResult, userList: $userList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatBlocStateImpl &&
            (identical(other.fetchUserResult, fetchUserResult) ||
                other.fetchUserResult == fetchUserResult) &&
            const DeepCollectionEquality().equals(other._userList, _userList));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    fetchUserResult,
    const DeepCollectionEquality().hash(_userList),
  );

  /// Create a copy of ChatBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatBlocStateImplCopyWith<_$ChatBlocStateImpl> get copyWith =>
      __$$ChatBlocStateImplCopyWithImpl<_$ChatBlocStateImpl>(this, _$identity);
}

abstract class _ChatBlocState implements ChatBlocState {
  factory _ChatBlocState({
    final FetchUserResult? fetchUserResult,
    final List<UserListModel>? userList,
  }) = _$ChatBlocStateImpl;

  @override
  FetchUserResult? get fetchUserResult;
  @override
  List<UserListModel>? get userList;

  /// Create a copy of ChatBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatBlocStateImplCopyWith<_$ChatBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
