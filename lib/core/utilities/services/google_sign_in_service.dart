import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn;
  final Logger logger;

  GoogleSignInService(this._googleSignIn) : logger = Logger();

  Future<GoogleSignInAuthentication?> signIn() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      logger.i('User Name: ${googleUser.displayName}');
      logger.i('User Email: ${googleUser.email}');
    } else {
      logger.e('Sign in failed or was cancelled.');
    }
    final googleAuth = await googleUser?.authentication;
    logger.i('idToken: ${googleAuth?.idToken}');
    logger.i('accessToken: ${googleAuth?.accessToken}');
    return googleAuth;
  }

  Future<GoogleSignInAccount?> signOut() async {
    return await _googleSignIn.signOut();
  }
}
