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

final class SignupEvent extends AuthBlocEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String accountType;
  final String phoneNumber;

  SignupEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.accountType,
    required this.phoneNumber,
  });
}
