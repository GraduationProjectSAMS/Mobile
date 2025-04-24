import 'package:graduation_project/features/home/data/models/offers_model.dart';

import '../../../favorites/data/models/favorites_model.dart';
import '../../data/models/product_model.dart';

class ProductEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int quantity;
  final bool isFavorite;
  final String type;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.isFavorite,
    required this.type,
  });

  factory ProductEntity.loading() => const ProductEntity(
        isFavorite: false,
        type: '',
        id: 0,
        name: 'test name',
        description: 'test description',
        price: 0.0,
        imageUrl: '',
        quantity: 0,
      );
}

final productsWaiting = List.filled(10, ProductEntity.loading());

extension ProductModelMapper on List<ProductData>? {
  List<ProductEntity> get toEntityList =>
      this?.map((e) => e.toEntity).toList() ?? [];
}

extension OfferModelMapper on List<OffersData>? {
  List<ProductEntity> get toEntityList =>
      this?.map((e) => e.toEntity).toList() ?? [];
}

extension FavoritesDataMapper on List<FavoritesData>? {
  List<ProductEntity> get toEntityList =>
      this?.map((e) => e.toEntity).toList() ?? [];
}
