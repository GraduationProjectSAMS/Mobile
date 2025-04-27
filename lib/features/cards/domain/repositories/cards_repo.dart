import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class CardsRepo {
  Future<Either<Failure, void>> addToCard(
      {required dynamic productId, required String type, int quantity = 1});
  Future<Either<Failure, List<ProductEntity>>> getCards();
  Future<Either<Failure, void>> removeFromCard(
      {required dynamic productId, required String type});
}
