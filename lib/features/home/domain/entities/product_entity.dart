import 'package:graduation_project/features/home/data/models/offers_model.dart';

import '../../data/models/product_model.dart';

class ProductEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String quantity;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  factory ProductEntity.loading() => const ProductEntity(
        id: 0,
        name: 'test name',
        description: 'test description',
        price: 0.0,
        imageUrl: '',
        quantity: " test",
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
