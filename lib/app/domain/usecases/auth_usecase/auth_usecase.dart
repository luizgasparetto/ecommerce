import 'package:ecommerce/core/exports/exports.dart';

abstract class AuthUsecase {
  Future<void> signUp({
    required String email,
    required String password,
    BuildContext context,
  });

  Future<void> signIn({
    required String email,
    required String password,
    BuildContext context,
  });

  Future<void> logOut();
  Future<void> resetPassword(String email);
  Widget getLandingPage(BuildContext context);
}
