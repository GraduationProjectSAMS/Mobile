import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

abstract class HomeRemoteRepo {
  Future<List<ProductEntity>> getProducts();

  Future<List<ProductEntity>> getOffers();

  Future<void> addOffer({
    required Map<String, dynamic> offerData,
    void Function(int, int)? onSendProgress,
  });
}
