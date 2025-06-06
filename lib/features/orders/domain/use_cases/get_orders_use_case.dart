import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';
import 'package:graduation_project/features/orders/domain/repositories/orders_repo.dart';

import '../../../../core/errors/failure.dart';

class GetOrdersUseCase {
  final OrdersRepo _ordersRepo;

  GetOrdersUseCase(this._ordersRepo);

  Future<Either<Failure, List<OrderEntity>>> call({dynamic orderType}) async {
    return _ordersRepo.getOrders(orderType: orderType);
  }
}
