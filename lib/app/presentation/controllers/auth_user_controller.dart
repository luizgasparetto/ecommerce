import 'package:ecommerce/app/domain/usecases/auth_user_usecase/auth_user_usecase.dart';

class AuthUserController {
  final AuthUserUseCase _authUserUseCase;

  AuthUserController(this._authUserUseCase);

  Future<void> register(String email, String password) async {
    return await _authUserUseCase.register(email, password);
  }

  Future<void> login(String email, String password) async {
    return await _authUserUseCase.login(email, password);
  }
}
