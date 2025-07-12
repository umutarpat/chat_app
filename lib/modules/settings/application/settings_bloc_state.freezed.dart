// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SettingsBlocState {
  LogoutResult? get logoutResult => throw _privateConstructorUsedError;

  /// Create a copy of SettingsBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsBlocStateCopyWith<SettingsBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsBlocStateCopyWith<$Res> {
  factory $SettingsBlocStateCopyWith(
    SettingsBlocState value,
    $Res Function(SettingsBlocState) then,
  ) = _$SettingsBlocStateCopyWithImpl<$Res, SettingsBlocState>;
  @useResult
  $Res call({LogoutResult? logoutResult});
}

/// @nodoc
class _$SettingsBlocStateCopyWithImpl<$Res, $Val extends SettingsBlocState>
    implements $SettingsBlocStateCopyWith<$Res> {
  _$SettingsBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logoutResult = freezed}) {
    return _then(
      _value.copyWith(
            logoutResult: freezed == logoutResult
                ? _value.logoutResult
                : logoutResult // ignore: cast_nullable_to_non_nullable
                      as LogoutResult?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SettingsBlocStateImplCopyWith<$Res>
    implements $SettingsBlocStateCopyWith<$Res> {
  factory _$$SettingsBlocStateImplCopyWith(
    _$SettingsBlocStateImpl value,
    $Res Function(_$SettingsBlocStateImpl) then,
  ) = __$$SettingsBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LogoutResult? logoutResult});
}

/// @nodoc
class __$$SettingsBlocStateImplCopyWithImpl<$Res>
    extends _$SettingsBlocStateCopyWithImpl<$Res, _$SettingsBlocStateImpl>
    implements _$$SettingsBlocStateImplCopyWith<$Res> {
  __$$SettingsBlocStateImplCopyWithImpl(
    _$SettingsBlocStateImpl _value,
    $Res Function(_$SettingsBlocStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logoutResult = freezed}) {
    return _then(
      _$SettingsBlocStateImpl(
        logoutResult: freezed == logoutResult
            ? _value.logoutResult
            : logoutResult // ignore: cast_nullable_to_non_nullable
                  as LogoutResult?,
      ),
    );
  }
}

/// @nodoc

class _$SettingsBlocStateImpl implements _SettingsBlocState {
  _$SettingsBlocStateImpl({this.logoutResult});

  @override
  final LogoutResult? logoutResult;

  @override
  String toString() {
    return 'SettingsBlocState(logoutResult: $logoutResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsBlocStateImpl &&
            (identical(other.logoutResult, logoutResult) ||
                other.logoutResult == logoutResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, logoutResult);

  /// Create a copy of SettingsBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsBlocStateImplCopyWith<_$SettingsBlocStateImpl> get copyWith =>
      __$$SettingsBlocStateImplCopyWithImpl<_$SettingsBlocStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SettingsBlocState implements SettingsBlocState {
  factory _SettingsBlocState({final LogoutResult? logoutResult}) =
      _$SettingsBlocStateImpl;

  @override
  LogoutResult? get logoutResult;

  /// Create a copy of SettingsBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsBlocStateImplCopyWith<_$SettingsBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
