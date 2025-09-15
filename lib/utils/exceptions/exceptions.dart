class TExceptions implements Exception {
  final String message;
  final int? statusCode;

  const TExceptions(this.message, [this.statusCode]);

  factory TExceptions.fromCode(String message, {int? statusCode}) {
    if (message == 'unexpected-error') {
      return TExceptions(
        'An unexpected error occurred. Please try again.',
        statusCode ?? 500,
      );
    } else {
      return TExceptions(message, statusCode);
    }

    // switch (message) {
    //   case 'email-already-in-use':
    //     return TExceptions(
    //       'The email address is already registered. Please use a different email.',
    //       statusCode ?? 409,
    //     );
    //   case 'invalid-email':
    //     return TExceptions(
    //       'The email address provided is invalid. Please enter a valid email.',
    //       statusCode ?? 400,
    //     );
    //   case 'weak-password':
    //     return TExceptions(
    //       'The password is too weak. Please choose a stronger password.',
    //       statusCode ?? 400,
    //     );
    //   case 'user-disabled':
    //     return TExceptions(
    //       'This user account has been disabled. Please contact support for assistance.',
    //       statusCode ?? 403,
    //     );
    //   case 'user-not-found':
    //     return TExceptions(
    //       'Invalid login details. User not found.',
    //       statusCode ?? 404,
    //     );
    //   case 'wrong-password':
    //   case 'INVALID_LOGIN_CREDENTIALS':
    //   case 'invalid-password':
    //     return TExceptions(
    //       'Incorrect password. Please check your password and try again.',
    //       statusCode ?? 401,
    //     );
    //   case 'too-many-requests':
    //     return TExceptions(
    //       'Too many requests. Please try again later.',
    //       statusCode ?? 429,
    //     );
    //   case 'invalid-argument':
    //     return TExceptions(
    //       'Invalid argument provided to the authentication method.',
    //       statusCode ?? 400,
    //     );
    //   case 'invalid-phone-number':
    //     return TExceptions(
    //       'The provided phone number is invalid.',
    //       statusCode ?? 400,
    //     );
    //   case 'operation-not-allowed':
    //     return TExceptions(
    //       'The sign-in provider is disabled for your Firebase project.',
    //       statusCode ?? 403,
    //     );
    //   case 'session-cookie-expired':
    //     return TExceptions(
    //       'The Firebase session cookie has expired. Please sign in again.',
    //       statusCode ?? 401,
    //     );
    //   case 'uid-already-exists':
    //     return TExceptions(
    //       'The provided user ID is already in use by another user.',
    //       statusCode ?? 409,
    //     );
    //   case 'sign_in_failed':
    //     return TExceptions(
    //       'Sign-in failed. Please try again.',
    //       statusCode ?? 400,
    //     );
    //   case 'network-request-failed':
    //     return TExceptions(
    //       'Network request failed. Please check your internet connection.',
    //       statusCode ?? 503,
    //     );
    //   case 'internal-error':
    //     return TExceptions(
    //       'Internal error. Please try again later.',
    //       statusCode ?? 500,
    //     );
    //   case 'invalid-verification-code':
    //     return TExceptions(
    //       'Invalid verification code. Please enter a valid code.',
    //       statusCode ?? 400,
    //     );
    //   case 'invalid-verification-id':
    //     return TExceptions(
    //       'Invalid verification ID. Please request a new verification code.',
    //       statusCode ?? 400,
    //     );
    //   case 'quota-exceeded':
    //     return TExceptions(
    //       'Quota exceeded. Please try again later.',
    //       statusCode ?? 429,
    //     );
    //   default:
    //     return TExceptions(
    //       'An unexpected error occurred. Please try again.',
    //       statusCode ?? 500,
    //     );
    // }
  }

  @override
  String toString() => 'TExceptions($statusCode): $message';
}
