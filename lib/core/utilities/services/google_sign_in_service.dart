import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn;
  final Logger logger;

  GoogleSignInService(this._googleSignIn) : logger = Logger();

  Future<GoogleSignInAuthentication?> signIn() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    return googleAuth;
  }

  Future<GoogleSignInAccount?> signOut() async {
    return _googleSignIn.signOut();
  }
}
