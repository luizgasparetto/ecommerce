abstract class AuthUserService {
  void authCheck();
  Future<void> register(String email, String password);
  Future<void> login(String email, String password);
}
