import 'package:ecommerce/app/domain/services/auth_user_service.dart';

class AuthRoute {
  final AuthUserService _authUserService;

  AuthRoute(this._authUserService);

  String authCheck() {
    final user = _authUserService.getUser();

    return user == null ? '/login' : '/home';
  }
}
