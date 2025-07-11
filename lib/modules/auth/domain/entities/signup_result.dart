sealed class SignupResult {}

final class SignupSuccess extends SignupResult {}

final class UserAlreadyExists extends SignupResult {
  UserAlreadyExists();
}
