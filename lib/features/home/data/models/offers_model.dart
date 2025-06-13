import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

import '../../domain/entities/offer_products_entity.dart';

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
    this.offerTheme,
  });

  OffersData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    photoUrl = json['photo_url'];
    description = json['description'];
    quantity = json['quantity'];
    isProductInFavorite = json['in_wish_list'];
    offerTheme = json['theme'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(OffersProductModel.fromJson(v));
      });
    }
  }

  num? id;
  String? title;
  String? price;
  String? photoUrl;
  String? description;
  num? quantity;
  bool? isProductInFavorite;
  String? offerTheme;
  List<OffersProductModel>? products;

  ProductEntity get toEntity => ProductEntity(
      isFavorite: isProductInFavorite ?? false,
      type: AppConstants.offers,
      id: id?.toInt() ?? 0,
      name: title ?? '',
      description: description ?? '',
      price: double.tryParse(price.toString()) ?? 1,
      imageUrl: photoUrl ==
              'https://furnisique.servehttp.com/storage/products/images/1DsaMK8LbiV2a6XysnDZw35OTa4L1ypkK9NQ5r4n.png'
          ? AppConstants.kNullProductImage
          : photoUrl ?? '',
      maxQuantity: quantity?.toInt() ?? 0,
      offerProducts: products.toEntityList,
      offerTheme: offerTheme ?? ',');
}

class OffersProductModel {
  final int id;
  final String name;
  final String imageUrl;
  final double price;

  OffersProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  OfferProductsEntity get toEntity => OfferProductsEntity(
        id: id,
        name: name,
        imageUrl: imageUrl,
        price: price,
      );

  factory OffersProductModel.fromJson(Map<String, dynamic> json) {
    return OffersProductModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      price: double.parse(json['price']),
    );
  }
}
