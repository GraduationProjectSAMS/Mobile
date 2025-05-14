import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

import '../../data/models/order_model.dart';

class OrderEntity {
  final int orderId;
  final String orderStatus;
  final String orderDate;
  final String deliveryDate;
  final String paymentMethod;
  final String shippingAddress;
  final String totalPrice;
  final List<ProductEntity> products;

  const OrderEntity({
    required this.orderId,
    required this.orderStatus,
    required this.orderDate,
    required this.deliveryDate,
    required this.paymentMethod,
    required this.shippingAddress,
    required this.totalPrice,
    this.products = const [],
  });

  factory OrderEntity.loading() => const OrderEntity(
        orderId: 0,
        orderStatus: 'test test status',
        orderDate: 'test test date',
        deliveryDate: 'test test  date',
        paymentMethod: 'test test method',
        shippingAddress: 'test test address',
        totalPrice: '300 EGP',
      );
}

final ordersWaiting = List.filled(10, OrderEntity.loading());

extension OrderModelMapper on List<OrderData>? {
  List<OrderEntity> get toEntityList =>
      this?.map((e) => e.toEntity).toList() ?? [];
}
