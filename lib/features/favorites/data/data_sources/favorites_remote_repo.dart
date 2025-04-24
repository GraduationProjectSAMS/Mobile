import '../../../home/domain/entities/product_entity.dart';

abstract class FavoritesRemoteRepo {
  Future<void> addToFavorite(
      {required dynamic productId, required String type});

  Future<List<ProductEntity>> getFavorites();
}
