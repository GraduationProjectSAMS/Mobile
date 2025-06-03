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
    this.maxQuantity,
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
    maxQuantity = json['max_quantity'];
  }

  num? id;
  String? type;
  String? description;
  String? price;
  num? quantity;
  num? maxQuantity;
  String? name;
  String? theme;
  String? imageUrl;

  ProductEntity get toEntity {
    return ProductEntity(
      id: id?.toInt() ?? 0,
      type: type == 'offer' ? AppConstants.offers : AppConstants.products,
      description: description??'',
      price: double.tryParse(price.toString()) ?? 1,
      maxQuantity: maxQuantity?.toInt() ?? quantity?.toInt() ?? 0,
      carQuantity: quantity?.toInt() ?? 0,
      name: name??'',
      isFavorite: true,
      imageUrl:  imageUrl ==
          'https://furnisique.servehttp.com/storage/products/images/1DsaMK8LbiV2a6XysnDZw35OTa4L1ypkK9NQ5r4n.png'
          ? AppConstants.kNullProductImage
          : imageUrl ?? '',
    );
  }
}
