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

  Future<LoginEntity> sendGoogleTokenToBackEnd({required String googleToken});

  Future<void> setForgetPasswordOtp({
    required String email,
  });

  Future<LoginEntity> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });
}
