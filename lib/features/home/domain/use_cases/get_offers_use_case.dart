import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repo.dart';

class GetOffersUseCase {
  final HomeRepo _homeRepo;

  GetOffersUseCase(this._homeRepo);

  Future<Either<Failure, List<ProductEntity>>> getOffers() async {
    return _homeRepo.getOffers();
  }
}
