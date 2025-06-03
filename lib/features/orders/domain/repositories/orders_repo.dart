import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/create_order_model.dart';
import '../../data/models/order_location_model.dart';
import '../entities/order_location_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders({String? orderType});

  Future<Either<Failure, void>> setOrderLocation(
      {required OrderLocationModel orderLocationModel});

  Future<Either<Failure, OrderLocationEntity>> getOrderLocations();

  Future<Either<Failure, void>> createOrder(
      {required CreateOrderModel createOrderModel});

  Future<Either<Failure, OrderEntity>> getOrderDetails({dynamic orderId});

  Future<Either<Failure, void>> updateOrderStatus({
    required String orderId,
    required int statusId,
  });
}
