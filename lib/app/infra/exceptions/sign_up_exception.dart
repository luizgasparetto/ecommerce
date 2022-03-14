class SignUpException implements Exception {
  final String errorMessage;

  SignUpException([this.errorMessage = 'Some error happened']);

  factory SignUpException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return SignUpException(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return SignUpException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return SignUpException(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return SignUpException(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return SignUpException(
          'Please enter a stronger password.',
        );
      default:
        return SignUpException();
    }
  }
}
