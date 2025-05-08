import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/pay_mob_request_model.dart';
import '../entities/pay_mob_entity.dart';
import '../repositories/payment_repo.dart';

class GetPayMobClientKeyUseCase {
final PaymentRepo _paymentRepo;

  GetPayMobClientKeyUseCase(this._paymentRepo);

    Future<Either<Failure, PayMobEntity>> call(
        {required PayMobRequestModel payMobRequestModel}) async {
      return  _paymentRepo.getPaymentSecretKey(
          payMobRequestModel: payMobRequestModel);
    }
}