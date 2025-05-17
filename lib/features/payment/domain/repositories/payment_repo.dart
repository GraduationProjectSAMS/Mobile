import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/pay_mob_request_model.dart';
import '../entities/pay_mob_entity.dart';

abstract class PaymentRepo {
  Future<Either<Failure, PayMobEntity>> getPaymentSecretKey(
      {required PayMobRequestModel payMobRequestModel});
}
