import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/orders_repo.dart';

class ChangeOrderStatusUseCase {
  final OrdersRepo _ordersRepo;

  ChangeOrderStatusUseCase(this._ordersRepo);

  Future<Either<Failure, void>> call({
    required String orderId,
    required int statusId,
  }) async {
    return _ordersRepo.updateOrderStatus(
      orderId: orderId,
      statusId: statusId,
    );
  }
}
