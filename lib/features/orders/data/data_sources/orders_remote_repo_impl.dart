import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:graduation_project/features/orders/data/models/create_order_model.dart';
import 'package:graduation_project/features/orders/data/models/order_model.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';
import 'package:graduation_project/features/orders/domain/entities/order_location_entity.dart';

import '../../../../core/utilities/services/api_service.dart';
import '../models/order_location_model.dart';
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

  @override
  Future<void> setOrderLocation(
      {required OrderLocationModel orderLocationModel}) async {
    await apiService.postData(
      endPoint: AppEndpoints.ordersSippingAddress,
      formData: orderLocationModel.toJson(),
    );
  }

  @override
  Future<OrderLocationEntity> getOrderLocations() async {
    final response = await apiService.getData(
      endPoint: AppEndpoints.geOrdersSippingAddress,
    );

    final orderLocationModel =
        OrderLocationModel.fromJson(response?.data['data']);
    return orderLocationModel.toEntity;
  }

  @override
  Future<void> createOrder({required CreateOrderModel createOrderModel}) async {
    await apiService.postData(
      endPoint: AppEndpoints.orders,
      formData: createOrderModel.toJson(),
    );
  }

// Implement methods here
}

final test = {
  'user_id': 230,
  'items': [
    {'id': 2, 'type': 'products', 'quantity': 2, 'price': '254.14'},
    {'id': 1, 'type': 'offers', 'quantity': 1, 'price': '604.76'}
  ],
  'payment_method': 'CC',
  'notes': ''
};
final test2 = {
  'user_id': 230,
  'items': [
    {'id': 1, 'type': 'offer', 'quantity': 4},
    {'id': 2, 'type': 'product', 'quantity': 10}
  ],
  'payment_method': 'CC',
  'notes': 'nothing new'
};
