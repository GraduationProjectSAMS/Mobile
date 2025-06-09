import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/login_entity.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, String>> signInWithGoogle();

  Future<Either<Failure, LoginEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, LoginEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, LoginEntity>> sendGoogleTokenToBackEnd({
    required String googleToken,
  });

  Future<Either<Failure, void>> setForgetPasswordOtp({
    required String email,
  });

  Future<Either<Failure, LoginEntity>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });
}
