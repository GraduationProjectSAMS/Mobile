import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/failure.dart';

import '../../../../core/errors/server_failure.dart';
import '../../domain/repo/authentication_repo.dart';
import '../data_sources/authentication_remote_repo.dart';

class AuthenticationRepoImpl implements AuthenticationRepo {
  final AuthenticationRemoteRepo _authenticationRemoteRepo;

  AuthenticationRepoImpl(this._authenticationRemoteRepo);

  @override
  Future<Either<Failure, String>> signInWithGoogle() async {
    try {
      final response = await _authenticationRemoteRepo.loginWithGoogle();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
