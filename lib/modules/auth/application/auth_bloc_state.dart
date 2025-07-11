import 'package:chat_app/modules/auth/domain/entities/forgot_password_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc_state.freezed.dart';

@freezed
abstract class AuthBlocState with _$AuthBlocState {
  factory AuthBlocState({
    @Default(false) bool? loginSuccessful,
    String? errorText,
    ForgotPasswordResult? forgotPasswordResult,
  }) = _AuthBlocState;
}
