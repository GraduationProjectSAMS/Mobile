import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRemoteRepo {
  Future<List<OrderEntity>> getOrders({String? orderType});
}
