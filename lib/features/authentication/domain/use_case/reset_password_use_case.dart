import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/login_entity.dart';
import '../repo/authentication_repo.dart';

class ResetPasswordUseCase {
  final AuthenticationRepo _authenticationRepo;

  ResetPasswordUseCase(this._authenticationRepo);

  Future<Either<Failure, LoginEntity>> call({
    required String email,
    required String otp,
    required String newPassword,
  }) {
    return _authenticationRepo.resetPassword(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );
  }
}
