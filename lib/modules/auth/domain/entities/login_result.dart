sealed class LoginResult {}

final class LoginSuccess extends LoginResult {}

final class LoginFailure extends LoginResult {
  final String message;
  LoginFailure(this.message);
}
