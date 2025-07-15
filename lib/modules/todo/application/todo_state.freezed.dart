// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TodoBlocState {
  GetCurrentLoggedInUserResult? get getCurrentLoggedInUserResult =>
      throw _privateConstructorUsedError;
  UserListModel? get currentLoggedInUser => throw _privateConstructorUsedError;
  GetTodosResult? get getTodosResult => throw _privateConstructorUsedError;
  List<TodoModel>? get todos => throw _privateConstructorUsedError;
  CreateTodoResult? get createTodoResult => throw _privateConstructorUsedError;
  UpdateTodoResult? get updateTodoResult => throw _privateConstructorUsedError;
  DeleteTodoResult? get deleteTodoResult => throw _privateConstructorUsedError;

  /// Create a copy of TodoBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoBlocStateCopyWith<TodoBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoBlocStateCopyWith<$Res> {
  factory $TodoBlocStateCopyWith(
    TodoBlocState value,
    $Res Function(TodoBlocState) then,
  ) = _$TodoBlocStateCopyWithImpl<$Res, TodoBlocState>;
  @useResult
  $Res call({
    GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    UserListModel? currentLoggedInUser,
    GetTodosResult? getTodosResult,
    List<TodoModel>? todos,
    CreateTodoResult? createTodoResult,
    UpdateTodoResult? updateTodoResult,
    DeleteTodoResult? deleteTodoResult,
  });

  $UserListModelCopyWith<$Res>? get currentLoggedInUser;
}

/// @nodoc
class _$TodoBlocStateCopyWithImpl<$Res, $Val extends TodoBlocState>
    implements $TodoBlocStateCopyWith<$Res> {
  _$TodoBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getCurrentLoggedInUserResult = freezed,
    Object? currentLoggedInUser = freezed,
    Object? getTodosResult = freezed,
    Object? todos = freezed,
    Object? createTodoResult = freezed,
    Object? updateTodoResult = freezed,
    Object? deleteTodoResult = freezed,
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
            getTodosResult: freezed == getTodosResult
                ? _value.getTodosResult
                : getTodosResult // ignore: cast_nullable_to_non_nullable
                      as GetTodosResult?,
            todos: freezed == todos
                ? _value.todos
                : todos // ignore: cast_nullable_to_non_nullable
                      as List<TodoModel>?,
            createTodoResult: freezed == createTodoResult
                ? _value.createTodoResult
                : createTodoResult // ignore: cast_nullable_to_non_nullable
                      as CreateTodoResult?,
            updateTodoResult: freezed == updateTodoResult
                ? _value.updateTodoResult
                : updateTodoResult // ignore: cast_nullable_to_non_nullable
                      as UpdateTodoResult?,
            deleteTodoResult: freezed == deleteTodoResult
                ? _value.deleteTodoResult
                : deleteTodoResult // ignore: cast_nullable_to_non_nullable
                      as DeleteTodoResult?,
          )
          as $Val,
    );
  }

  /// Create a copy of TodoBlocState
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
abstract class _$$TodoBlocStateImplCopyWith<$Res>
    implements $TodoBlocStateCopyWith<$Res> {
  factory _$$TodoBlocStateImplCopyWith(
    _$TodoBlocStateImpl value,
    $Res Function(_$TodoBlocStateImpl) then,
  ) = __$$TodoBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    UserListModel? currentLoggedInUser,
    GetTodosResult? getTodosResult,
    List<TodoModel>? todos,
    CreateTodoResult? createTodoResult,
    UpdateTodoResult? updateTodoResult,
    DeleteTodoResult? deleteTodoResult,
  });

  @override
  $UserListModelCopyWith<$Res>? get currentLoggedInUser;
}

/// @nodoc
class __$$TodoBlocStateImplCopyWithImpl<$Res>
    extends _$TodoBlocStateCopyWithImpl<$Res, _$TodoBlocStateImpl>
    implements _$$TodoBlocStateImplCopyWith<$Res> {
  __$$TodoBlocStateImplCopyWithImpl(
    _$TodoBlocStateImpl _value,
    $Res Function(_$TodoBlocStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getCurrentLoggedInUserResult = freezed,
    Object? currentLoggedInUser = freezed,
    Object? getTodosResult = freezed,
    Object? todos = freezed,
    Object? createTodoResult = freezed,
    Object? updateTodoResult = freezed,
    Object? deleteTodoResult = freezed,
  }) {
    return _then(
      _$TodoBlocStateImpl(
        getCurrentLoggedInUserResult: freezed == getCurrentLoggedInUserResult
            ? _value.getCurrentLoggedInUserResult
            : getCurrentLoggedInUserResult // ignore: cast_nullable_to_non_nullable
                  as GetCurrentLoggedInUserResult?,
        currentLoggedInUser: freezed == currentLoggedInUser
            ? _value.currentLoggedInUser
            : currentLoggedInUser // ignore: cast_nullable_to_non_nullable
                  as UserListModel?,
        getTodosResult: freezed == getTodosResult
            ? _value.getTodosResult
            : getTodosResult // ignore: cast_nullable_to_non_nullable
                  as GetTodosResult?,
        todos: freezed == todos
            ? _value._todos
            : todos // ignore: cast_nullable_to_non_nullable
                  as List<TodoModel>?,
        createTodoResult: freezed == createTodoResult
            ? _value.createTodoResult
            : createTodoResult // ignore: cast_nullable_to_non_nullable
                  as CreateTodoResult?,
        updateTodoResult: freezed == updateTodoResult
            ? _value.updateTodoResult
            : updateTodoResult // ignore: cast_nullable_to_non_nullable
                  as UpdateTodoResult?,
        deleteTodoResult: freezed == deleteTodoResult
            ? _value.deleteTodoResult
            : deleteTodoResult // ignore: cast_nullable_to_non_nullable
                  as DeleteTodoResult?,
      ),
    );
  }
}

/// @nodoc

class _$TodoBlocStateImpl implements _TodoBlocState {
  _$TodoBlocStateImpl({
    this.getCurrentLoggedInUserResult,
    this.currentLoggedInUser,
    this.getTodosResult,
    final List<TodoModel>? todos,
    this.createTodoResult,
    this.updateTodoResult,
    this.deleteTodoResult,
  }) : _todos = todos;

  @override
  final GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult;
  @override
  final UserListModel? currentLoggedInUser;
  @override
  final GetTodosResult? getTodosResult;
  final List<TodoModel>? _todos;
  @override
  List<TodoModel>? get todos {
    final value = _todos;
    if (value == null) return null;
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CreateTodoResult? createTodoResult;
  @override
  final UpdateTodoResult? updateTodoResult;
  @override
  final DeleteTodoResult? deleteTodoResult;

  @override
  String toString() {
    return 'TodoBlocState(getCurrentLoggedInUserResult: $getCurrentLoggedInUserResult, currentLoggedInUser: $currentLoggedInUser, getTodosResult: $getTodosResult, todos: $todos, createTodoResult: $createTodoResult, updateTodoResult: $updateTodoResult, deleteTodoResult: $deleteTodoResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoBlocStateImpl &&
            (identical(
                  other.getCurrentLoggedInUserResult,
                  getCurrentLoggedInUserResult,
                ) ||
                other.getCurrentLoggedInUserResult ==
                    getCurrentLoggedInUserResult) &&
            (identical(other.currentLoggedInUser, currentLoggedInUser) ||
                other.currentLoggedInUser == currentLoggedInUser) &&
            (identical(other.getTodosResult, getTodosResult) ||
                other.getTodosResult == getTodosResult) &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.createTodoResult, createTodoResult) ||
                other.createTodoResult == createTodoResult) &&
            (identical(other.updateTodoResult, updateTodoResult) ||
                other.updateTodoResult == updateTodoResult) &&
            (identical(other.deleteTodoResult, deleteTodoResult) ||
                other.deleteTodoResult == deleteTodoResult));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    getCurrentLoggedInUserResult,
    currentLoggedInUser,
    getTodosResult,
    const DeepCollectionEquality().hash(_todos),
    createTodoResult,
    updateTodoResult,
    deleteTodoResult,
  );

  /// Create a copy of TodoBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoBlocStateImplCopyWith<_$TodoBlocStateImpl> get copyWith =>
      __$$TodoBlocStateImplCopyWithImpl<_$TodoBlocStateImpl>(this, _$identity);
}

abstract class _TodoBlocState implements TodoBlocState {
  factory _TodoBlocState({
    final GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    final UserListModel? currentLoggedInUser,
    final GetTodosResult? getTodosResult,
    final List<TodoModel>? todos,
    final CreateTodoResult? createTodoResult,
    final UpdateTodoResult? updateTodoResult,
    final DeleteTodoResult? deleteTodoResult,
  }) = _$TodoBlocStateImpl;

  @override
  GetCurrentLoggedInUserResult? get getCurrentLoggedInUserResult;
  @override
  UserListModel? get currentLoggedInUser;
  @override
  GetTodosResult? get getTodosResult;
  @override
  List<TodoModel>? get todos;
  @override
  CreateTodoResult? get createTodoResult;
  @override
  UpdateTodoResult? get updateTodoResult;
  @override
  DeleteTodoResult? get deleteTodoResult;

  /// Create a copy of TodoBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoBlocStateImplCopyWith<_$TodoBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
