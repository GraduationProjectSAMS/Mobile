import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/authentication/domain/repo/authentication_repo.dart';

import '../../../../core/errors/failure.dart';

class SignInWithGoogleUseCase{
  final AuthenticationRepo _authenticationRepo;

  SignInWithGoogleUseCase(this._authenticationRepo);

  Future<Either<Failure, String>> call() async {
    return await _authenticationRepo.signInWithGoogle();
  }
}