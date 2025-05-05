import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/favorites_repo.dart';

class AddToFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  AddToFavoritesUseCase(this._favoritesRepo);

  Future<Either<Failure, void>> call(
      {required dynamic productId, required String type}) async {
    return _favoritesRepo.addToFavorite(productId: productId, type: type);
  }
}
