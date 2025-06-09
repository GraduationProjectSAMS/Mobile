import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repo/authentication_repo.dart';

class SendResetPasswordOtpUseCase {
  final AuthenticationRepo _authenticationRepo;

  SendResetPasswordOtpUseCase(this._authenticationRepo);

  Future<Either<Failure, void>> call({
    required String email,
  }) {
    return _authenticationRepo.setForgetPasswordOtp(
      email: email,
    );
  }
}
