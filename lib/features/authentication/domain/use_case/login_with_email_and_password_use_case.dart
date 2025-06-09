import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/server_failure.dart';

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
    final result = await _authenticationRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.fold(
      // 1) Propagate any repo failure
      Left.new,

      // 2) On success, inspect the roleName
      (loginEntity) {
        if (loginEntity.roleName.toLowerCase() == 'user' &&
            Platform.isWindows) {
          // return a Failure if the role is admin
          return Left(ServerFailure('users are not allowed to login here.'));
        }
        // otherwise propagate the successful entity
        return Right(loginEntity);
      },
    );
  }
}
