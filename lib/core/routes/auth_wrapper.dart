import 'package:ecommerce/app/domain/repositories/auth_repository.dart';
import 'package:ecommerce/app/presentation/ui/views/auth/login_page.dart';
import 'package:ecommerce/app/presentation/ui/views/home_page.dart';
import 'package:flutter/cupertino.dart';

class AuthWrapper {
  final AuthRepository authRepository;

  AuthWrapper(this.authRepository);

  Widget authRoute() {
    final user = authRepository.getUser();

    return user == null ? const LoginPage() : const HomePage();
  }
}
