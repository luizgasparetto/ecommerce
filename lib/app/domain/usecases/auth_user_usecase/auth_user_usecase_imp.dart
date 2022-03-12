import 'package:ecommerce/app/domain/services/auth_user_service.dart';
import 'package:ecommerce/app/domain/usecases/auth_user_usecase/auth_user_usecase.dart';

class AuthUserUseCaseImp implements AuthUserUseCase {
  final AuthUserService _authUserService;

  AuthUserUseCaseImp(this._authUserService);

  @override
  Future<void> login(String email, String password) async {
    return await _authUserService.login(email, password);
  }

  @override
  Future<void> register(String email, String password) async {
    return await _authUserService.register(email, password);
  }
}
