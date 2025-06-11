import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../repositories/favorites_repo.dart';

class GetFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  GetFavoritesUseCase(this._favoritesRepo);

  Future<Either<Failure, List<ProductEntity>>> call() async{
    final result =await _favoritesRepo.getFavorites();
    return result.fold(
      Left.new,
      (products) => Right(products.reversed.toList()),
    );
  }
}
