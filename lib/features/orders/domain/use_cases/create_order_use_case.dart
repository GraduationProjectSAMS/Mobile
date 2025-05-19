import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/create_order_model.dart';
import '../repositories/orders_repo.dart';

class CreateOrderUseCase {
  final OrdersRepo _ordersRepo;

  CreateOrderUseCase(this._ordersRepo);

  Future<Either<Failure, void>> call(
      {required CreateOrderModel createOrderModel}) async {
    return _ordersRepo.createOrder(createOrderModel: createOrderModel);
  }
}
