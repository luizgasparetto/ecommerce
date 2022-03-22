import 'package:ecommerce/app/domain/usecases/auth_usecase/auth_usecase.dart';
import 'package:ecommerce/app/infra/exceptions/sign_in_exception.dart';
import 'package:ecommerce/app/infra/exceptions/sign_up_exception.dart';
import 'package:ecommerce/core/exports/exports.dart';

class AuthUsecaseImp implements AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecaseImp(this._authRepository);

  @override
  Future<void> signUp({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    try {
      await _authRepository.signUp(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final message = SignUpException.fromCode(e.code);

      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: Text(message.errorMessage),
      ));
    }
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    try {
      await _authRepository.signIn(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final message = SignInException.fromCode(e.code);

      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: Text(message.errorMessage),
      ));
    }
  }

  @override
  Future<void> logOut() async {
    return await _authRepository.logOut();
  }

  @override
  Future<void> resetPassword(String email) async {
    return await _authRepository.resetPassword(email);
  }

  @override
  Widget getLandingPage(BuildContext context) {
    return _authRepository.getLandingPage(context);
  }
}
