import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

abstract class CardsRemoteRepo {
  Future<void> addToCard(
      {required dynamic productId, required String type, int quantity = 1});

  Future<List<ProductEntity>> getCards();

  Future<void> removeFromCard(
      {required dynamic productId, required String type});
}
