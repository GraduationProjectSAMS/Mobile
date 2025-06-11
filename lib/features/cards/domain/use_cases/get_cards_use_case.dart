import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../repositories/cards_repo.dart';

class GetCardsUseCase {
  final CardsRepo _cardsRepo;

  GetCardsUseCase(this._cardsRepo);

  Future<Either<Failure, List<ProductEntity>>> call() async {
    final result= await _cardsRepo.getCards();
    return result.fold(
      Left.new,
      (products) => Right(products.reversed.toList()),
    );
  }
}
