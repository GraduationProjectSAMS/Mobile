import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/login_entity.dart';
import '../repo/authentication_repo.dart';

class SignupWithGmailUseCase {
  final AuthenticationRepo _authenticationRepo;

  SignupWithGmailUseCase(this._authenticationRepo);

  Future<Either<Failure, LoginEntity>> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return _authenticationRepo.signUp(
      name: name,
      email: email,
      password: password,
    );
  }
}
