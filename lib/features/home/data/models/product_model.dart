import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

class ProductModel {
  ProductModel({
    this.error,
    this.productData,
  });

  ProductModel.fromJson(dynamic json) {
    error = json['error'];
    if (json['data'] != null) {
      productData = [];
      json['data'].forEach((v) {
        productData?.add(ProductData.fromJson(v));
      });
    }
  }

  String? error;
  List<ProductData>? productData;
}

class ProductData {
  ProductData({
    this.id,
    this.name,
    this.category,
    this.aesthetic,
    this.rooms,
    this.description,
    this.price,
    this.quantity,
    this.imageUrl,
    this.isProductInFavorite,
  });

  ProductData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    aesthetic = json['Aesthetic'];
    rooms = json['rooms'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    imageUrl = json['image_url'];
    isProductInFavorite = json['in_wish_list'];
  }

  num? id;
  String? name;
  String? category;
  String? aesthetic;
  String? rooms;
  String? description;
  String? price;
  num? quantity;
  String? imageUrl;
  bool? isProductInFavorite;

  ProductEntity get toEntity => ProductEntity(
        isFavorite: isProductInFavorite ?? false,
        type: AppConstants.products,
        id: id?.toInt() ?? 0,
        name: name.toString(),
        description: description.toString(),
        price: double.tryParse(price.toString()) ?? 0.0,
        imageUrl: AppConstants.kNullProductImage,
        quantity: quantity?.toInt() ?? 0,
      );
}
