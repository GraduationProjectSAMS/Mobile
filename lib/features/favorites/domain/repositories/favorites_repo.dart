import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/product_entity.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, void>> addToFavorite(
      {required dynamic productId, required String type});

  Future<Either<Failure, List<ProductEntity>>> getFavorites();
}
