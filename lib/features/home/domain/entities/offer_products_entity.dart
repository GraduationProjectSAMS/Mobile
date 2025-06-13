import 'package:graduation_project/features/home/data/models/offers_model.dart';

class OfferProductsEntity {
  final int id;
  final String name;
  final String imageUrl;
  final double price;

  OfferProductsEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory OfferProductsEntity.loading() => OfferProductsEntity(
        name: 'test name',
        id: 1,
        imageUrl: '',
        price: 0.0,
      );
}

final offersProductWaiting = List.filled(3, OfferProductsEntity.loading());

extension MapToOfferProductsEntity on List<OffersProductModel>? {
  List<OfferProductsEntity> get toEntityList =>
      this?.map((e) => e.toEntity).toList() ?? [];
}
