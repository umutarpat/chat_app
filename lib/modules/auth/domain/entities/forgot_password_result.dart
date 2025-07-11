sealed class ForgotPasswordResult {}

final class ForgotPasswordSuccess extends ForgotPasswordResult {}

final class ForgotPasswordUserDoesntExist extends ForgotPasswordResult {
  ForgotPasswordUserDoesntExist();
}
