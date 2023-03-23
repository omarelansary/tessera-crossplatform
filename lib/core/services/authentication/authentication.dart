import 'package:tessera/core/services/authentication/facebook_authentication.dart';
import 'package:tessera/core/services/authentication/google_authentication.dart';
import 'package:tessera/features/authentication/data/user_model.dart';

/// Abstract class for authentication services.
abstract class AuthService {
  /// Returns a [UserModel] if the user successfully signs in.
  Future<UserModel?> signIn();

  /// Signs the user out.
  Future<void> signOut();

  /// Returns a string representation of the class.
  @override
  String toString() {
    return runtimeType.toString();
  }

  /// Returns an instance of the class based on the string.
  static AuthService fromString(String string) {
    if (string == 'GoogleAuthService') {
      return GoogleAuthService();
    } else if (string == 'FacebookAuthService') {
      return FacebookAuthService();
    } else {
      return GoogleAuthService();
    }
  }
}
