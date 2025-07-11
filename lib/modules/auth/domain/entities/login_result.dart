sealed class LoginResult {}

final class LoginSuccess extends LoginResult {}

final class LoginFailure extends LoginResult {
  LoginFailure();
}
