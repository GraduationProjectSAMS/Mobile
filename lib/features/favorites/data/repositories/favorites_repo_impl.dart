import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../../domain/repositories/favorites_repo.dart';
import '../data_sources/favorites_remote_repo.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesRemoteRepo remoteRepo;

  FavoritesRepoImpl(this.remoteRepo);

  @override
  Future<Either<Failure, void>> addToFavorite(
      {required productId, required String type}) async {
    try {
      await remoteRepo.addToFavorite(productId: productId, type: type);
      return const Right(null);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    try {
      final favorites = await remoteRepo.getFavorites();
      return Right(favorites);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }
}
