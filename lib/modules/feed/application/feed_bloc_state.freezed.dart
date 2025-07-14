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
  String? get getFeedResult => throw _privateConstructorUsedError;

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
  $Res call({String? getFeedResult});
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
  $Res call({Object? getFeedResult = freezed}) {
    return _then(
      _value.copyWith(
            getFeedResult: freezed == getFeedResult
                ? _value.getFeedResult
                : getFeedResult // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
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
  $Res call({String? getFeedResult});
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
  $Res call({Object? getFeedResult = freezed}) {
    return _then(
      _$FeedBlocStateImpl(
        getFeedResult: freezed == getFeedResult
            ? _value.getFeedResult
            : getFeedResult // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FeedBlocStateImpl implements _FeedBlocState {
  _$FeedBlocStateImpl({this.getFeedResult});

  @override
  final String? getFeedResult;

  @override
  String toString() {
    return 'FeedBlocState(getFeedResult: $getFeedResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedBlocStateImpl &&
            (identical(other.getFeedResult, getFeedResult) ||
                other.getFeedResult == getFeedResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getFeedResult);

  /// Create a copy of FeedBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedBlocStateImplCopyWith<_$FeedBlocStateImpl> get copyWith =>
      __$$FeedBlocStateImplCopyWithImpl<_$FeedBlocStateImpl>(this, _$identity);
}

abstract class _FeedBlocState implements FeedBlocState {
  factory _FeedBlocState({final String? getFeedResult}) = _$FeedBlocStateImpl;

  @override
  String? get getFeedResult;

  /// Create a copy of FeedBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedBlocStateImplCopyWith<_$FeedBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
