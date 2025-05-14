import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';

import 'order_products.dart';

class OrderModel {
  OrderModel({
    this.message,
    this.orderData,
  });

  OrderModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      orderData = [];
      json['data'].forEach((v) {
        orderData?.add(OrderData.fromJson(v));
      });
    }
  }

  String? message;
  List<OrderData>? orderData;
}

class OrderData {
  OrderData({
    this.id,
    this.userId,
    this.items,
    this.status,
    this.shippingAddress,
    this.paymentMethod,
    this.totalPrice,
    this.notes,
    this.orderedAt,
    this.deliveryDate,
  });

  OrderData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(OrderProducts.fromJson(v));
      });
    }
    status = json['status'];
    shippingAddress = json['shipping_address'];
    paymentMethod = json['payment_method'];
    totalPrice = json['total_price'];
    notes = json['notes'];
    orderedAt = json['ordered_at'];
    deliveryDate = json['delivery_date'];
  }

  num? id;
  num? userId;
  List<OrderProducts>? items;
  String? status;
  String? shippingAddress;
  String? paymentMethod;
  String? totalPrice;
  String? notes;
  String? orderedAt;
  String? deliveryDate;

  OrderEntity get toEntity {
    return OrderEntity(
      orderId: id?.toInt() ?? 0,
      orderStatus: status ?? '',
      orderDate: orderedAt ?? '',
      deliveryDate: deliveryDate ?? '',
      paymentMethod: paymentMethod ?? '',
      shippingAddress: shippingAddress ?? '',
      totalPrice: totalPrice ?? '',
    );
  }
}
