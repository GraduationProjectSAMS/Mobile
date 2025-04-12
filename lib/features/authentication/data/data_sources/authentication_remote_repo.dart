import '../../domain/entity/login_entity.dart';

abstract class AuthenticationRemoteRepo {
  Future<LoginEntity> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<LoginEntity> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<String> loginWithGoogle();
}
