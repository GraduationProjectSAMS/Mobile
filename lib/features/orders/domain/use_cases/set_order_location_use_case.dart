import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/order_location_model.dart';
import '../repositories/orders_repo.dart';

class SetOrderLocationUseCase {
  final OrdersRepo _ordersRepo;

  SetOrderLocationUseCase(this._ordersRepo);

  Future<Either<Failure, void>> call(
      {required OrderLocationModel orderLocationModel}) async {
    return _ordersRepo.setOrderLocation(orderLocationModel: orderLocationModel);
  }
}
