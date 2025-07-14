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
  GetCurrentLoggedInUserResult? get getCurrentLoggedInUserResult =>
      throw _privateConstructorUsedError;
  UserListModel? get currentLoggedInUser => throw _privateConstructorUsedError;
  FetchUserResult? get fetchUserResult => throw _privateConstructorUsedError;
  List<UserListModel>? get userList => throw _privateConstructorUsedError;
  SendMessageResult? get sendMessageResult =>
      throw _privateConstructorUsedError;
  GetMessagesResult? get getMessagesResult =>
      throw _privateConstructorUsedError;
  List<MessageModel>? get messages => throw _privateConstructorUsedError;
  GetChatsResult? get getChatsResult => throw _privateConstructorUsedError;
  List<ChatModel>? get chats => throw _privateConstructorUsedError;
  JoinMeetingResult? get joinMeetingResult =>
      throw _privateConstructorUsedError;

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
  $Res call({
    GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    UserListModel? currentLoggedInUser,
    FetchUserResult? fetchUserResult,
    List<UserListModel>? userList,
    SendMessageResult? sendMessageResult,
    GetMessagesResult? getMessagesResult,
    List<MessageModel>? messages,
    GetChatsResult? getChatsResult,
    List<ChatModel>? chats,
    JoinMeetingResult? joinMeetingResult,
  });

  $UserListModelCopyWith<$Res>? get currentLoggedInUser;
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
  $Res call({
    Object? getCurrentLoggedInUserResult = freezed,
    Object? currentLoggedInUser = freezed,
    Object? fetchUserResult = freezed,
    Object? userList = freezed,
    Object? sendMessageResult = freezed,
    Object? getMessagesResult = freezed,
    Object? messages = freezed,
    Object? getChatsResult = freezed,
    Object? chats = freezed,
    Object? joinMeetingResult = freezed,
  }) {
    return _then(
      _value.copyWith(
            getCurrentLoggedInUserResult:
                freezed == getCurrentLoggedInUserResult
                ? _value.getCurrentLoggedInUserResult
                : getCurrentLoggedInUserResult // ignore: cast_nullable_to_non_nullable
                      as GetCurrentLoggedInUserResult?,
            currentLoggedInUser: freezed == currentLoggedInUser
                ? _value.currentLoggedInUser
                : currentLoggedInUser // ignore: cast_nullable_to_non_nullable
                      as UserListModel?,
            fetchUserResult: freezed == fetchUserResult
                ? _value.fetchUserResult
                : fetchUserResult // ignore: cast_nullable_to_non_nullable
                      as FetchUserResult?,
            userList: freezed == userList
                ? _value.userList
                : userList // ignore: cast_nullable_to_non_nullable
                      as List<UserListModel>?,
            sendMessageResult: freezed == sendMessageResult
                ? _value.sendMessageResult
                : sendMessageResult // ignore: cast_nullable_to_non_nullable
                      as SendMessageResult?,
            getMessagesResult: freezed == getMessagesResult
                ? _value.getMessagesResult
                : getMessagesResult // ignore: cast_nullable_to_non_nullable
                      as GetMessagesResult?,
            messages: freezed == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<MessageModel>?,
            getChatsResult: freezed == getChatsResult
                ? _value.getChatsResult
                : getChatsResult // ignore: cast_nullable_to_non_nullable
                      as GetChatsResult?,
            chats: freezed == chats
                ? _value.chats
                : chats // ignore: cast_nullable_to_non_nullable
                      as List<ChatModel>?,
            joinMeetingResult: freezed == joinMeetingResult
                ? _value.joinMeetingResult
                : joinMeetingResult // ignore: cast_nullable_to_non_nullable
                      as JoinMeetingResult?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatBlocState
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
abstract class _$$ChatBlocStateImplCopyWith<$Res>
    implements $ChatBlocStateCopyWith<$Res> {
  factory _$$ChatBlocStateImplCopyWith(
    _$ChatBlocStateImpl value,
    $Res Function(_$ChatBlocStateImpl) then,
  ) = __$$ChatBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    UserListModel? currentLoggedInUser,
    FetchUserResult? fetchUserResult,
    List<UserListModel>? userList,
    SendMessageResult? sendMessageResult,
    GetMessagesResult? getMessagesResult,
    List<MessageModel>? messages,
    GetChatsResult? getChatsResult,
    List<ChatModel>? chats,
    JoinMeetingResult? joinMeetingResult,
  });

  @override
  $UserListModelCopyWith<$Res>? get currentLoggedInUser;
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
  $Res call({
    Object? getCurrentLoggedInUserResult = freezed,
    Object? currentLoggedInUser = freezed,
    Object? fetchUserResult = freezed,
    Object? userList = freezed,
    Object? sendMessageResult = freezed,
    Object? getMessagesResult = freezed,
    Object? messages = freezed,
    Object? getChatsResult = freezed,
    Object? chats = freezed,
    Object? joinMeetingResult = freezed,
  }) {
    return _then(
      _$ChatBlocStateImpl(
        getCurrentLoggedInUserResult: freezed == getCurrentLoggedInUserResult
            ? _value.getCurrentLoggedInUserResult
            : getCurrentLoggedInUserResult // ignore: cast_nullable_to_non_nullable
                  as GetCurrentLoggedInUserResult?,
        currentLoggedInUser: freezed == currentLoggedInUser
            ? _value.currentLoggedInUser
            : currentLoggedInUser // ignore: cast_nullable_to_non_nullable
                  as UserListModel?,
        fetchUserResult: freezed == fetchUserResult
            ? _value.fetchUserResult
            : fetchUserResult // ignore: cast_nullable_to_non_nullable
                  as FetchUserResult?,
        userList: freezed == userList
            ? _value._userList
            : userList // ignore: cast_nullable_to_non_nullable
                  as List<UserListModel>?,
        sendMessageResult: freezed == sendMessageResult
            ? _value.sendMessageResult
            : sendMessageResult // ignore: cast_nullable_to_non_nullable
                  as SendMessageResult?,
        getMessagesResult: freezed == getMessagesResult
            ? _value.getMessagesResult
            : getMessagesResult // ignore: cast_nullable_to_non_nullable
                  as GetMessagesResult?,
        messages: freezed == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<MessageModel>?,
        getChatsResult: freezed == getChatsResult
            ? _value.getChatsResult
            : getChatsResult // ignore: cast_nullable_to_non_nullable
                  as GetChatsResult?,
        chats: freezed == chats
            ? _value._chats
            : chats // ignore: cast_nullable_to_non_nullable
                  as List<ChatModel>?,
        joinMeetingResult: freezed == joinMeetingResult
            ? _value.joinMeetingResult
            : joinMeetingResult // ignore: cast_nullable_to_non_nullable
                  as JoinMeetingResult?,
      ),
    );
  }
}

/// @nodoc

class _$ChatBlocStateImpl implements _ChatBlocState {
  _$ChatBlocStateImpl({
    this.getCurrentLoggedInUserResult,
    this.currentLoggedInUser,
    this.fetchUserResult,
    final List<UserListModel>? userList,
    this.sendMessageResult,
    this.getMessagesResult,
    final List<MessageModel>? messages,
    this.getChatsResult,
    final List<ChatModel>? chats,
    this.joinMeetingResult,
  }) : _userList = userList,
       _messages = messages,
       _chats = chats;

  @override
  final GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult;
  @override
  final UserListModel? currentLoggedInUser;
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
  final SendMessageResult? sendMessageResult;
  @override
  final GetMessagesResult? getMessagesResult;
  final List<MessageModel>? _messages;
  @override
  List<MessageModel>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final GetChatsResult? getChatsResult;
  final List<ChatModel>? _chats;
  @override
  List<ChatModel>? get chats {
    final value = _chats;
    if (value == null) return null;
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final JoinMeetingResult? joinMeetingResult;

  @override
  String toString() {
    return 'ChatBlocState(getCurrentLoggedInUserResult: $getCurrentLoggedInUserResult, currentLoggedInUser: $currentLoggedInUser, fetchUserResult: $fetchUserResult, userList: $userList, sendMessageResult: $sendMessageResult, getMessagesResult: $getMessagesResult, messages: $messages, getChatsResult: $getChatsResult, chats: $chats, joinMeetingResult: $joinMeetingResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatBlocStateImpl &&
            (identical(
                  other.getCurrentLoggedInUserResult,
                  getCurrentLoggedInUserResult,
                ) ||
                other.getCurrentLoggedInUserResult ==
                    getCurrentLoggedInUserResult) &&
            (identical(other.currentLoggedInUser, currentLoggedInUser) ||
                other.currentLoggedInUser == currentLoggedInUser) &&
            (identical(other.fetchUserResult, fetchUserResult) ||
                other.fetchUserResult == fetchUserResult) &&
            const DeepCollectionEquality().equals(other._userList, _userList) &&
            (identical(other.sendMessageResult, sendMessageResult) ||
                other.sendMessageResult == sendMessageResult) &&
            (identical(other.getMessagesResult, getMessagesResult) ||
                other.getMessagesResult == getMessagesResult) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.getChatsResult, getChatsResult) ||
                other.getChatsResult == getChatsResult) &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            (identical(other.joinMeetingResult, joinMeetingResult) ||
                other.joinMeetingResult == joinMeetingResult));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    getCurrentLoggedInUserResult,
    currentLoggedInUser,
    fetchUserResult,
    const DeepCollectionEquality().hash(_userList),
    sendMessageResult,
    getMessagesResult,
    const DeepCollectionEquality().hash(_messages),
    getChatsResult,
    const DeepCollectionEquality().hash(_chats),
    joinMeetingResult,
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
    final GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    final UserListModel? currentLoggedInUser,
    final FetchUserResult? fetchUserResult,
    final List<UserListModel>? userList,
    final SendMessageResult? sendMessageResult,
    final GetMessagesResult? getMessagesResult,
    final List<MessageModel>? messages,
    final GetChatsResult? getChatsResult,
    final List<ChatModel>? chats,
    final JoinMeetingResult? joinMeetingResult,
  }) = _$ChatBlocStateImpl;

  @override
  GetCurrentLoggedInUserResult? get getCurrentLoggedInUserResult;
  @override
  UserListModel? get currentLoggedInUser;
  @override
  FetchUserResult? get fetchUserResult;
  @override
  List<UserListModel>? get userList;
  @override
  SendMessageResult? get sendMessageResult;
  @override
  GetMessagesResult? get getMessagesResult;
  @override
  List<MessageModel>? get messages;
  @override
  GetChatsResult? get getChatsResult;
  @override
  List<ChatModel>? get chats;
  @override
  JoinMeetingResult? get joinMeetingResult;

  /// Create a copy of ChatBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatBlocStateImplCopyWith<_$ChatBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
