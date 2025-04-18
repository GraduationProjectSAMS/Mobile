import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repo.dart';

class GetProductsUseCase {
  final HomeRepo _homeRepo;

  GetProductsUseCase(this._homeRepo);

  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    return await _homeRepo.getProducts();
  }
}
