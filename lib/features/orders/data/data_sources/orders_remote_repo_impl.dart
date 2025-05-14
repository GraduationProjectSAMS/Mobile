import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:graduation_project/features/orders/data/models/order_model.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';

import '../../../../core/utilities/services/api_service.dart';
import 'orders_remote_repo.dart';


class OrdersRemoteRepoImpl implements OrdersRemoteRepo {
  final ApiService apiService;

  OrdersRemoteRepoImpl(this.apiService);

  @override
  Future<List<OrderEntity>> getOrders({String? orderType}) async {
    final response = await apiService.getData(
      endPoint: AppEndpoints.orders,
    );

    final orderModel = OrderModel.fromJson(response?.data);
    final orders = orderModel.orderData.toEntityList;
    return orders;
  }

// Implement methods here
}
