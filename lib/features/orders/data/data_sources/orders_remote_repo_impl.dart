import 'package:dio/dio.dart';
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
  Future<List<OrderEntity>> getOrders({dynamic orderType}) async {
    final response = await apiService.getData(
      endPoint: AppEndpoints.orders,
      data: {
        if (orderType != null) 'status_id': orderType,
      },
    );

    final orderModel = OrderModel.fromJson(response?.data);
    final orders = orderModel.orderData.toEntityList;
    return orders;
  }

  @override
  Future<void> setOrderLocation(
      {required OrderLocationModel orderLocationModel}) async {
    await apiService.postData(
      options: Options(
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
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
      options: Options(
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
      endPoint: AppEndpoints.orders,
      formData: createOrderModel.toJson(),
    );
  }

  @override
  Future<OrderEntity> getOrderDetails({dynamic orderId}) async {
    final response = await apiService.getData(
      endPoint: '${AppEndpoints.orders}/$orderId',
    );

    final orderData = OrderData.fromJson(response?.data['data']);
    return orderData.toEntity;
  }

  @override
  Future<void> updateOrderStatus({
    required String orderId,
    required int statusId,
  }) async {
    await apiService.updateData(
      endPoint: '${AppEndpoints.orders}/$orderId',
      data: {'status_id': statusId},
    );
  }
// Implement methods here
}
