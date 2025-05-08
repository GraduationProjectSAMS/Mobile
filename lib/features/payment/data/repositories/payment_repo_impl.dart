import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/failure.dart';
import 'package:graduation_project/features/payment/data/models/pay_mob_request_model.dart';
import 'package:graduation_project/features/payment/domain/entities/pay_mob_entity.dart';

import '../../domain/repositories/payment_repo.dart';
import '../data_sources/payment_remote_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final PaymentRemoteRepo remoteRepo;

  PaymentRepoImpl(this.remoteRepo);

  @override
  Future<Either<Failure, PayMobEntity>> getPaymentSecretKey(
      {required PayMobRequestModel payMobRequestModel}) async{
    try {
      final entity =await remoteRepo.getPayMobSecretKey(payMobRequestModel: payMobRequestModel);
      return Right(entity);
    } on Exception catch (e) {
      return Left(appServerFailure(e));
    }


  }

// Implement repository methods here
}
