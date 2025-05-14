import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

class OrderProducts {
  OrderProducts({
    this.id,
    this.type,
    this.quantity,
    this.price,
  });

  OrderProducts.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    quantity = json['quantity'];
    price = json['price'];
  }

  num? id;
  String? type;
  num? quantity;
  String? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['quantity'] = quantity;
    map['price'] = price;
    return map;
  }

  ProductEntity get toEntity {
    return ProductEntity(
      id: id?.toInt() ?? 0,
      name: type ?? '',
      price: double.tryParse(price ?? '0') ?? 0.0,
      carQuantity: quantity?.toInt() ?? 0,
      isFavorite: false,
      type: '',
      maxQuantity: 0,
      description: '',
      imageUrl: '',
    );
  }
}

extension ProductsEntityMappers on List<ProductEntity>? {
  List<OrderProducts> get toOrderProductList =>
      this?.map((e) => e.toOrderProductsMode).toList() ?? [];
}
