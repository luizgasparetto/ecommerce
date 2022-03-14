class SignInException implements Exception {
  final String errorMessage;

  SignInException([this.errorMessage = 'Some error happened']);

  factory SignInException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return SignInException(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return SignInException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return SignInException(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return SignInException(
          'Incorrect password, please try again.',
        );
      default:
        return SignInException();
    }
  }
}
