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
  });

  OffersData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    photoUrl = json['photo_url'];
  }

  num? id;
  String? title;
  String? price;
  String? photoUrl;

  ProductEntity get toEntity => ProductEntity(
      id: id?.toInt() ?? 0,
      name: title.toString(),
      description: '',
      price: double.tryParse(price.toString()) ?? 1,
      imageUrl: AppConstants.kNullProductImage,
      quantity: '');
}
