sealed class AuthBlocEvent {}

final class SetupUserEvent extends AuthBlocEvent {}

final class LoginEvent extends AuthBlocEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

final class ResetPasswordEvent extends AuthBlocEvent {
  final String email;

  ResetPasswordEvent({required this.email});
}
