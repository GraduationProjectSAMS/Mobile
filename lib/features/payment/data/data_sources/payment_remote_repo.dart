
import '../../domain/entities/pay_mob_entity.dart';
import '../models/pay_mob_request_model.dart';

abstract class PaymentRemoteRepo {
  Future<PayMobEntity> getPayMobSecretKey({
    required PayMobRequestModel payMobRequestModel,
  });
}
