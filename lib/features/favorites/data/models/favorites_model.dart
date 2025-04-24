import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

class FavoritesModel {
  FavoritesModel({
    this.message,
    this.favoritesData,
  });

  FavoritesModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      favoritesData = [];
      json['data'].forEach((v) {
        favoritesData?.add(FavoritesData.fromJson(v));
      });
    }
  }

  String? message;
  List<FavoritesData>? favoritesData;
}

class FavoritesData {
  FavoritesData({
    this.id,
    this.type,
    this.description,
    this.price,
    this.quantity,
    this.name,
    this.theme,
    this.imageUrl,
  });

  FavoritesData.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    name = json['name'];
    theme = json['theme'];
    imageUrl = json['image_url'];
  }

  num? id;
  String? type;
  String? description;
  String? price;
  num? quantity;
  String? name;
  String? theme;
  String? imageUrl;

  ProductEntity get toEntity {
    return ProductEntity(
      id: id?.toInt() ?? 0,
      type: type == 'offer' ? AppConstants.offers : AppConstants.products,
      description: description.toString(),
      price: double.tryParse(price.toString()) ?? 1,
      quantity: quantity?.toInt() ?? 0,
      name: name.toString(),
      isFavorite: true,
      imageUrl: AppConstants.kNullProductImage,
    );
  }
}
