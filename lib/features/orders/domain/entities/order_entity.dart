import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:graduation_project/features/orders/presentation/widgets/order_details_status_bar.dart';

import '../../data/models/order_model.dart';

class OrderEntity {
  final int orderId;
  final OrderStatus currentStatus;
  final String orderDate;
  final String deliveryDate;
  final String paymentMethod;
  final String shippingAddress;
  final String totalPrice;
  final String orderNotes;
  final String onTheWayDate;

  final String orderReceivedDate;
  final List<ProductEntity> products;
  final String hashId;

  const OrderEntity({
    required this.orderId,
    required this.currentStatus,
    required this.orderDate,
    required this.deliveryDate,
    required this.paymentMethod,
    required this.shippingAddress,
    required this.totalPrice,
    this.onTheWayDate = '',
    this.hashId = '',
    this.orderReceivedDate = '',
    this.orderNotes = '',
    this.products = const [],
  });

  factory OrderEntity.loading() => OrderEntity(
        orderId: 0,
        hashId: 'test test id',
        currentStatus: OrderStatus.ordered,
        orderDate: 'test test date',
        deliveryDate: 'test test  date',
        paymentMethod: 'test test method',
        shippingAddress: 'test test address',
        totalPrice: '300 EGP',
        orderNotes: 'test test notes',
        onTheWayDate: 'test test on the way date',
        orderReceivedDate: 'test test delivery date',
        products: productsWaiting,
      );
}

final ordersWaiting = List.filled(10, OrderEntity.loading());

extension OrderModelMapper on List<OrderData>? {
  List<OrderEntity> get toEntityList =>
      this?.map((e) => e.toEntity).toList() ?? [];
}
