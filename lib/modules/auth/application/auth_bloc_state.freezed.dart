// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthBlocState {

 bool? get loginSuccessful; String? get errorText; ForgotPasswordResult? get forgotPasswordResult;
/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthBlocStateCopyWith<AuthBlocState> get copyWith => _$AuthBlocStateCopyWithImpl<AuthBlocState>(this as AuthBlocState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBlocState&&(identical(other.loginSuccessful, loginSuccessful) || other.loginSuccessful == loginSuccessful)&&(identical(other.errorText, errorText) || other.errorText == errorText)&&(identical(other.forgotPasswordResult, forgotPasswordResult) || other.forgotPasswordResult == forgotPasswordResult));
}


@override
int get hashCode => Object.hash(runtimeType,loginSuccessful,errorText,forgotPasswordResult);

@override
String toString() {
  return 'AuthBlocState(loginSuccessful: $loginSuccessful, errorText: $errorText, forgotPasswordResult: $forgotPasswordResult)';
}


}

/// @nodoc
abstract mixin class $AuthBlocStateCopyWith<$Res>  {
  factory $AuthBlocStateCopyWith(AuthBlocState value, $Res Function(AuthBlocState) _then) = _$AuthBlocStateCopyWithImpl;
@useResult
$Res call({
 bool? loginSuccessful, String? errorText, ForgotPasswordResult? forgotPasswordResult
});




}
/// @nodoc
class _$AuthBlocStateCopyWithImpl<$Res>
    implements $AuthBlocStateCopyWith<$Res> {
  _$AuthBlocStateCopyWithImpl(this._self, this._then);

  final AuthBlocState _self;
  final $Res Function(AuthBlocState) _then;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loginSuccessful = freezed,Object? errorText = freezed,Object? forgotPasswordResult = freezed,}) {
  return _then(_self.copyWith(
loginSuccessful: freezed == loginSuccessful ? _self.loginSuccessful : loginSuccessful // ignore: cast_nullable_to_non_nullable
as bool?,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,forgotPasswordResult: freezed == forgotPasswordResult ? _self.forgotPasswordResult : forgotPasswordResult // ignore: cast_nullable_to_non_nullable
as ForgotPasswordResult?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthBlocState].
extension AuthBlocStatePatterns on AuthBlocState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthBlocState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthBlocState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthBlocState value)  $default,){
final _that = this;
switch (_that) {
case _AuthBlocState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthBlocState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthBlocState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? loginSuccessful,  String? errorText,  ForgotPasswordResult? forgotPasswordResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthBlocState() when $default != null:
return $default(_that.loginSuccessful,_that.errorText,_that.forgotPasswordResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? loginSuccessful,  String? errorText,  ForgotPasswordResult? forgotPasswordResult)  $default,) {final _that = this;
switch (_that) {
case _AuthBlocState():
return $default(_that.loginSuccessful,_that.errorText,_that.forgotPasswordResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? loginSuccessful,  String? errorText,  ForgotPasswordResult? forgotPasswordResult)?  $default,) {final _that = this;
switch (_that) {
case _AuthBlocState() when $default != null:
return $default(_that.loginSuccessful,_that.errorText,_that.forgotPasswordResult);case _:
  return null;

}
}

}

/// @nodoc


class _AuthBlocState implements AuthBlocState {
   _AuthBlocState({this.loginSuccessful = false, this.errorText, this.forgotPasswordResult});
  

@override@JsonKey() final  bool? loginSuccessful;
@override final  String? errorText;
@override final  ForgotPasswordResult? forgotPasswordResult;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthBlocStateCopyWith<_AuthBlocState> get copyWith => __$AuthBlocStateCopyWithImpl<_AuthBlocState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthBlocState&&(identical(other.loginSuccessful, loginSuccessful) || other.loginSuccessful == loginSuccessful)&&(identical(other.errorText, errorText) || other.errorText == errorText)&&(identical(other.forgotPasswordResult, forgotPasswordResult) || other.forgotPasswordResult == forgotPasswordResult));
}


@override
int get hashCode => Object.hash(runtimeType,loginSuccessful,errorText,forgotPasswordResult);

@override
String toString() {
  return 'AuthBlocState(loginSuccessful: $loginSuccessful, errorText: $errorText, forgotPasswordResult: $forgotPasswordResult)';
}


}

/// @nodoc
abstract mixin class _$AuthBlocStateCopyWith<$Res> implements $AuthBlocStateCopyWith<$Res> {
  factory _$AuthBlocStateCopyWith(_AuthBlocState value, $Res Function(_AuthBlocState) _then) = __$AuthBlocStateCopyWithImpl;
@override @useResult
$Res call({
 bool? loginSuccessful, String? errorText, ForgotPasswordResult? forgotPasswordResult
});




}
/// @nodoc
class __$AuthBlocStateCopyWithImpl<$Res>
    implements _$AuthBlocStateCopyWith<$Res> {
  __$AuthBlocStateCopyWithImpl(this._self, this._then);

  final _AuthBlocState _self;
  final $Res Function(_AuthBlocState) _then;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loginSuccessful = freezed,Object? errorText = freezed,Object? forgotPasswordResult = freezed,}) {
  return _then(_AuthBlocState(
loginSuccessful: freezed == loginSuccessful ? _self.loginSuccessful : loginSuccessful // ignore: cast_nullable_to_non_nullable
as bool?,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,forgotPasswordResult: freezed == forgotPasswordResult ? _self.forgotPasswordResult : forgotPasswordResult // ignore: cast_nullable_to_non_nullable
as ForgotPasswordResult?,
  ));
}


}

// dart format on
