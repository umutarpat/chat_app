// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsBlocState {

 bool? get isLoading;
/// Create a copy of SettingsBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsBlocStateCopyWith<SettingsBlocState> get copyWith => _$SettingsBlocStateCopyWithImpl<SettingsBlocState>(this as SettingsBlocState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsBlocState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading);

@override
String toString() {
  return 'SettingsBlocState(isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SettingsBlocStateCopyWith<$Res>  {
  factory $SettingsBlocStateCopyWith(SettingsBlocState value, $Res Function(SettingsBlocState) _then) = _$SettingsBlocStateCopyWithImpl;
@useResult
$Res call({
 bool? isLoading
});




}
/// @nodoc
class _$SettingsBlocStateCopyWithImpl<$Res>
    implements $SettingsBlocStateCopyWith<$Res> {
  _$SettingsBlocStateCopyWithImpl(this._self, this._then);

  final SettingsBlocState _self;
  final $Res Function(SettingsBlocState) _then;

/// Create a copy of SettingsBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = freezed,}) {
  return _then(_self.copyWith(
isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsBlocState].
extension SettingsBlocStatePatterns on SettingsBlocState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsBlocState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsBlocState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsBlocState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsBlocState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsBlocState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsBlocState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsBlocState() when $default != null:
return $default(_that.isLoading);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? isLoading)  $default,) {final _that = this;
switch (_that) {
case _SettingsBlocState():
return $default(_that.isLoading);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? isLoading)?  $default,) {final _that = this;
switch (_that) {
case _SettingsBlocState() when $default != null:
return $default(_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsBlocState implements SettingsBlocState {
   _SettingsBlocState({this.isLoading});
  

@override final  bool? isLoading;

/// Create a copy of SettingsBlocState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsBlocStateCopyWith<_SettingsBlocState> get copyWith => __$SettingsBlocStateCopyWithImpl<_SettingsBlocState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsBlocState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading);

@override
String toString() {
  return 'SettingsBlocState(isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$SettingsBlocStateCopyWith<$Res> implements $SettingsBlocStateCopyWith<$Res> {
  factory _$SettingsBlocStateCopyWith(_SettingsBlocState value, $Res Function(_SettingsBlocState) _then) = __$SettingsBlocStateCopyWithImpl;
@override @useResult
$Res call({
 bool? isLoading
});




}
/// @nodoc
class __$SettingsBlocStateCopyWithImpl<$Res>
    implements _$SettingsBlocStateCopyWith<$Res> {
  __$SettingsBlocStateCopyWithImpl(this._self, this._then);

  final _SettingsBlocState _self;
  final $Res Function(_SettingsBlocState) _then;

/// Create a copy of SettingsBlocState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = freezed,}) {
  return _then(_SettingsBlocState(
isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
