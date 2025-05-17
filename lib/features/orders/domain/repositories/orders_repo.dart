import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders({String? orderType});
}
