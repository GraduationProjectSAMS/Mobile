import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/failure.dart';

import '../../../../core/errors/server_failure.dart';
import '../../domain/entity/login_entity.dart';
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

  @override
  Future<Either<Failure, LoginEntity>> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await _authenticationRemoteRepo.signUp(
        name: name,
        email: email,
        password: password,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response =
          await _authenticationRemoteRepo.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, LoginEntity>> sendGoogleTokenToBackEnd({required String googleToken}) async{
    try {
      final response =
      await _authenticationRemoteRepo.sendGoogleTokenToBackEnd(googleToken: googleToken);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
