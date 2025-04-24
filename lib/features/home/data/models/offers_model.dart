import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

class OffersModel {
  OffersModel({
    this.message,
    this.data,
  });

  OffersModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(OffersData.fromJson(v));
      });
    }
  }

  String? message;
  List<OffersData>? data;
}

class OffersData {
  OffersData({
    this.id,
    this.title,
    this.price,
    this.photoUrl,
    this.description,
    this.quantity,
    this.isProductInFavorite,
  });

  OffersData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    photoUrl = json['photo_url'];
    description = json['description'];
    quantity = json['quantity'];
    isProductInFavorite = json['in_wish_list'];
  }

  num? id;
  String? title;
  String? price;
  String? photoUrl;
  String? description;
  num? quantity;
  bool? isProductInFavorite;

  ProductEntity get toEntity => ProductEntity(
      isFavorite: isProductInFavorite ?? false,
      type: AppConstants.offers,
      id: id?.toInt() ?? 0,
      name: title.toString(),
      description: description.toString(),
      price: double.tryParse(price.toString()) ?? 1,
      imageUrl: AppConstants.kNullProductImage,
      quantity: quantity?.toInt() ?? 0);
}
