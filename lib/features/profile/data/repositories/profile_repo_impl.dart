import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/failure.dart';
import 'package:graduation_project/features/profile/domain/entities/user_entity.dart';

import '../../domain/repositories/profile_repo.dart';
import '../data_sources/profile_remote_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteRepo remoteRepo;

  ProfileRepoImpl(this.remoteRepo);

  @override
  Future<Either<Failure, UserEntity>> getProfileData() async {
    try {
      final response = await remoteRepo.getUserData();
      return Right(response);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await remoteRepo.logout();
      return Right(response);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> logoutFromGoogle() async {
    try {
      final response = await remoteRepo.logoutFromGoogle();
      return Right(response);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }
}
