import 'package:google_sign_in/google_sign_in.dart';
import 'package:shtcut_mobile/core/base/base_service.dart';

class SocialAuthService extends BaseService {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    // serverClientId:
    //     '948739211973-bh5k91e0224i8pqsun6c7qgateqrg0a4.apps.googleusercontent.com',
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.email',
    ],
  );
  set googleSignIn(GoogleSignIn signIn) => _googleSignIn = signIn;

  Future<String?> getGoogleToken() async {
    try {
      await _googleSignIn.signOut();

      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await account.authentication;

      // For debugging
      logger.i('Access Token: ${googleAuth.accessToken}');
      logger.i('ID Token: ${googleAuth.idToken}');
      logger.i('Email: ${account.email}');
      logger.i('ID: ${account.id}');
      logger.i('Name: ${account.displayName}');

      return googleAuth.accessToken;
    } catch (e) {
      logger.i('Google Sign In Error: $e');
      return null;
    }
  }
}
