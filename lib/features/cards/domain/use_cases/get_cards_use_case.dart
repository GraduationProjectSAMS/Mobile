import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../repositories/cards_repo.dart';

class GetCardsUseCase {
  final CardsRepo _cardsRepo;


  GetCardsUseCase(this._cardsRepo);

  Future<Either<Failure, List<ProductEntity>>> call()async{
    return  _cardsRepo.getCards();
  }
}