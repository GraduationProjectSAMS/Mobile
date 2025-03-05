import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService{
   final GoogleSignIn _googleSignIn;

    GoogleSignInService(this._googleSignIn);
   Future<GoogleSignInAuthentication?>   signIn() async {
   final googleUser=  await _googleSignIn.signIn();
   final googleAuth= await googleUser?.authentication;
   return googleAuth;
   }
    Future<GoogleSignInAccount?> signOut() async {
     return await _googleSignIn.signOut();
    }

}