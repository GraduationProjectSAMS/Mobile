import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/profile/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> getProfileData();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> logoutFromGoogle();
}
