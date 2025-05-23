import 'order_products.dart';

class CreateOrderModel {
  CreateOrderModel({
    this.userId,
    this.orderProducts,
    this.paymentMethod,
    this.notes,
  });

  CreateOrderModel.fromJson(dynamic json) {
    userId = json['user_id'];
    if (json['items'] != null) {
      orderProducts = [];
      json['items'].forEach((v) {
        orderProducts?.add(OrderProducts.fromJson(v));
      });
    }
    paymentMethod = json['payment_method'];
    notes = json['notes'];
  }

  num? userId;
  List<OrderProducts>? orderProducts;
  String? paymentMethod;
  String? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    if (orderProducts != null) {
      map['items'] = orderProducts?.map((v) => v.toJson()).toList();
    }
    map['payment_method'] = paymentMethod;
    map['notes'] = notes;
    return map;
  }
}
