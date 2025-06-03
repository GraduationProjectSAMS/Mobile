import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';
import 'package:graduation_project/features/orders/presentation/widgets/order_details_status_bar.dart';

import 'order_location_model.dart';
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
    this.orderHashId,
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

    shippingAddress = OrderLocationModel.fromJson(json['shipping_address']);
    paymentMethod = json['payment_method'];
    totalPrice =
        double.parse(json['total_price'].toString()).toStringAsFixed(2);
    notes = json['notes'];
    if (json['status'] != null) {
      status = [];
      json['status'].forEach((v) {
        status?.add(OrderStatusModel.fromJson(v));
      });
    }
    orderedAt = json['ordered_at'];
    deliveryDate = json['delivery_date'];
    orderHashId = json['fake_id'];
  }

  num? id;
  num? userId;
  List<OrderProducts>? items;
  List<OrderStatusModel>? status;
  OrderLocationModel? shippingAddress;
  String? paymentMethod;
  String? totalPrice;
  String? notes;
  String? orderedAt;
  String? deliveryDate;
  String? orderHashId;

  OrderEntity get toEntity {
    return OrderEntity(
      orderNotes: notes ?? '',
      products: items.toEntityList,
      orderId: id?.toInt() ?? 0,
      currentStatus: OrderStatus.fromIndex(
        status?.last.id?.toInt() ?? 0,
      ),
      onTheWayDate: status
              ?.firstWhere(
                (element) => element.id == OrderStatus.onTheWay.value,
                orElse: OrderStatusModel.new,
              )
              .createdAt ??
          '',
      orderReceivedDate: status
              ?.firstWhere(
                orElse: OrderStatusModel.new,
                (element) => element.id == OrderStatus.received.value,
              )
              .createdAt ??
          '',
      orderDate: orderedAt ?? '',
      deliveryDate: status
              ?.firstWhere(
                orElse: OrderStatusModel.new,
                (element) => element.id == OrderStatus.delivered.value,
              )
              .createdAt ??
          deliveryDate ??
          '',
      paymentMethod: paymentMethod ?? '',
      shippingAddress: shippingAddress?.address ?? '',
      totalPrice: totalPrice ?? '',
      hashId: orderHashId ?? '',
    );
  }
}

// make class for this
// {
// "id": 1,
// "name": "Pending",
// "created_at": "02-06-2025 22:55:02"
// },
class OrderStatusModel {
  OrderStatusModel({
    this.id,
    this.name,
    this.createdAt,
  });

  OrderStatusModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  num? id;
  String? name;
  String? createdAt;

  @override
  String toString() {
    return 'OrderStatus{id: $id, name: $name, createdAt: $createdAt}';
  }
}
