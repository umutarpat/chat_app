sealed class AuthBlocEvent {}

final class SetupEvent extends AuthBlocEvent {}

final class LoginEvent extends AuthBlocEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
