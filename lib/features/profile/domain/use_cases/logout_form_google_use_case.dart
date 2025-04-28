import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/profile_repo.dart';

class LogoutFormGoogleUseCase {
  final ProfileRepo _profileRepo;

  LogoutFormGoogleUseCase(this._profileRepo);

  Future<Either<Failure, void>> call()async{
    return _profileRepo.logoutFromGoogle();
  }
}