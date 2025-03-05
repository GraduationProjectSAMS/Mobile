import '../../../../core/utilities/services/google_sign_in_service.dart';
import 'authentication_remote_repo.dart';

class AuthenticationRemoteRepoImpl implements AuthenticationRemoteRepo {
  final GoogleSignInService _googleSignInService;

  AuthenticationRemoteRepoImpl(this._googleSignInService);
  @override
  Future<String> loginWithGoogle() async{
    final response= await _googleSignInService.signIn();
final tokenId= response?.idToken;
return tokenId??'';

  }







}