import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();

  Future<Either<Failure, List<ProductEntity>>> getOffers();

  Future<Either<Failure, void>> addOffer({
    required Map<String, dynamic> offerData,
    void Function(int, int)? onSendProgress,
  });
}
