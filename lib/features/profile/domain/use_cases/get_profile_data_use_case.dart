import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/profile/domain/repositories/profile_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

class GetProfileDataUseCase {
  final ProfileRepo _profileRepo;

  GetProfileDataUseCase(this._profileRepo);

  Future<Either<Failure, UserEntity>> getProfileData() async {
    return _profileRepo.getProfileData();
  }
}
