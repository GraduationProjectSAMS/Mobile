import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/order_location_entity.dart';
import '../repositories/orders_repo.dart';

class GetCurrentOrderLocationUseCase {
  final OrdersRepo _ordersRepo;

  GetCurrentOrderLocationUseCase(this._ordersRepo);

  Future<Either<Failure, OrderLocationEntity>> call() async {
    return _ordersRepo.getOrderLocations();
  }
}
