import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/order_entity.dart';
import '../repositories/orders_repo.dart';

class GetOrderDetailsUseCase {
  final OrdersRepo _ordersRepo;

  GetOrderDetailsUseCase(this._ordersRepo);

  Future<Either<Failure, OrderEntity>> call({dynamic orderId}) {
    return _ordersRepo.getOrderDetails(orderId: orderId);
  }
}
