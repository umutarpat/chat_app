import 'package:chat_app/modules/auth/domain/entities/forgot_password_result.dart';
import 'package:chat_app/modules/auth/domain/entities/login_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc_state.freezed.dart';

@freezed
abstract class AuthBlocState with _$AuthBlocState {
  factory AuthBlocState({
    ForgotPasswordResult? forgotPasswordResult,
    LoginResult? loginResult,
  }) = _AuthBlocState;
}
