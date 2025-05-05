import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/profile_repo.dart';

class LogoutUseCase {
  final ProfileRepo _profileRepo;

  LogoutUseCase(this._profileRepo);

  Future<Either<Failure, void>> call() async {
    return _profileRepo.logout();
  }
}
