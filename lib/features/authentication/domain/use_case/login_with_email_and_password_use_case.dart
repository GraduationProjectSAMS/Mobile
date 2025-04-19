import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/login_entity.dart';
import '../repo/authentication_repo.dart';

class LoginWithEmailAndPasswordUseCase {
  final AuthenticationRepo _authenticationRepo;

  LoginWithEmailAndPasswordUseCase(this._authenticationRepo);

  Future<Either<Failure, LoginEntity>> call({
    required String email,
    required String password,
  }) async {
    return _authenticationRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
