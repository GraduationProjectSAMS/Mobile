import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

// add this
// {
// "id": 197,
// "type": "product",
// "quantity": 3,
// "price": "250.00",
// "image_url": "https://furnisique.servehttp.com/storage/products/images/wrPotj3joarFbwyl2nXfPWALJ6s839VUKPLMewjS.jpg",
// "name": "Modern Sofa",
// "description": "A comfortable modern sofa with soft cushions."
// }
class OrderProducts {
  OrderProducts({
    this.id,
    this.type,
    this.quantity,
    this.price,
  });

// add this
// {
// "id": 197,
// "type": "product",
// "quantity": 3,
// "price": "250.00",
// "image_url": "https://furnisique.servehttp.com/storage/products/images/wrPotj3joarFbwyl2nXfPWALJ6s839VUKPLMewjS.jpg",
// "name": "Modern Sofa",
// "description": "A comfortable modern sofa with soft cushions."
// }
  OrderProducts.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    quantity = json['quantity'];
    price = json['price'];
    imageUrl = json['image_url'];
    name = json['name'];
    description = json['description'];
  }

// add this pragma dart
// {
// "id": 197,
// "type": "product",
// "quantity": 3,
// "price": "250.00",
// "image_url": "https://furnisique.servehttp.com/storage/products/images/wrPotj3joarFbwyl2nXfPWALJ6s839VUKPLMewjS.jpg",
// "name": "Modern Sofa",
// "description": "A comfortable modern sofa with soft cushions."
// }
  String? imageUrl;
  String? name;
  String? description;

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
      name: name ?? '',
      price: double.tryParse(price ?? '0') ?? 0.0,
      carQuantity: quantity?.toInt() ?? 0,
      isFavorite: false,
      type: type ?? '',
      maxQuantity: 0,
      description: description ?? '',
      imageUrl: imageUrl ?? '',
    );
  }

  OrderProducts copyWith({
    num? id,
    String? type,
    num? quantity,
    String? price,
  }) {
    return OrderProducts(
      id: id ?? this.id,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}

extension ProductsEntityMappers on List<ProductEntity>? {
  List<OrderProducts> get toOrderProductList =>
      this?.map((e) => e.toOrderProductsMode).toList() ?? [];
}
