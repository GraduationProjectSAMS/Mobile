import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';
import 'package:graduation_project/features/orders/domain/entities/order_location_entity.dart';

import '../models/create_order_model.dart';
import '../models/order_location_model.dart';

abstract class OrdersRemoteRepo {
  Future<List<OrderEntity>> getOrders({String? orderType});

  Future<void> setOrderLocation(
      {required OrderLocationModel orderLocationModel});

  Future<OrderLocationEntity> getOrderLocations();

  Future<void> createOrder({required CreateOrderModel createOrderModel});

  Future<OrderEntity> getOrderDetails({dynamic orderId});

  Future<void> updateOrderStatus({
    required String orderId,
    required String status,
  });
}
