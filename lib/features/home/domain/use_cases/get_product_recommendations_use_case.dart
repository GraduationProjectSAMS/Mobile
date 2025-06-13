import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repo.dart';

class GetProductRecommendationsUseCase {
  final HomeRepo _homeRepo;

  GetProductRecommendationsUseCase(this._homeRepo);

  Future<Either<Failure, List<ProductEntity>>> call() {
    return _homeRepo.getProductRecommendations();
  }
}
