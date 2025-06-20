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
    this.length,
    this.width,
    this.height,
    this.percentage,
  });

  ProductData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    aesthetic = json['aesthetic'];
    rooms = json['rooms'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    imageUrl = json['image_url'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    isProductInFavorite = json['in_wish_list'];
    percentage = json['percentage'];
  }

  num? id;
  String? name;
  String? category;
  String? aesthetic;
  String? rooms;
  String? description;
  String? price;
  num? quantity;
  num? length;
  num? width;
  num? height;
  String? imageUrl;
  bool? isProductInFavorite;
  String? percentage;

  ProductEntity get toEntity => ProductEntity(
        isFavorite: isProductInFavorite ?? false,
        type: AppConstants.products,
        id: id?.toInt() ?? 0,
        name: name ?? '',
        description: description ?? '',
        price: double.tryParse(price.toString()) ?? 0.0,
        imageUrl: imageUrl ==
                'https://furnisique.servehttp.com/storage/products/images/1DsaMK8LbiV2a6XysnDZw35OTa4L1ypkK9NQ5r4n.png'
            ? AppConstants.kNullProductImage
            : imageUrl ?? '',
        maxQuantity: quantity?.toInt() ?? 0,
        width: width?.toInt() ?? 0,
        length: length?.toInt() ?? 0,
        height: height?.toInt() ?? 0,
        productAesthetic: aesthetic ?? '',
        productCategory: category ?? '',
        productRoom: rooms ?? '',
        compatibilityPercentage:
            double.tryParse(percentage?.replaceAll('%', '') ?? '') ?? 0.0,
      );

  ProductData copyWith({
    num? id,
    String? name,
    String? category,
    String? aesthetic,
    String? rooms,
    String? description,
    String? price,
    num? quantity,
    num? length,
    num? width,
    num? height,
    String? imageUrl,
    bool? isProductInFavorite,
    String? percentage,
  }) {
    return ProductData(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      aesthetic: aesthetic ?? this.aesthetic,
      rooms: rooms ?? this.rooms,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      length: length ?? this.length,
      width: width ?? this.width,
      height: height ?? this.height,
      imageUrl: imageUrl ?? this.imageUrl,
      isProductInFavorite: isProductInFavorite ?? this.isProductInFavorite,
      percentage: percentage ?? this.percentage,
    );
  }
}
