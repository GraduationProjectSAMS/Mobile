import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/login_entity.dart';
import '../repo/authentication_repo.dart';

class SendGoogleTokenToBackEndUseCase {
  final AuthenticationRepo _authenticationRepo;

  SendGoogleTokenToBackEndUseCase(this._authenticationRepo);

  Future<Either<Failure, LoginEntity>> call({
    required String googleToken,
  })async{
    return await _authenticationRepo.sendGoogleTokenToBackEnd(
      googleToken: googleToken,
    );
  }
}