abstract class AuthRepositoryInterface {
  Future<void> setup();

  Future<void> login(String email, String password);
}
