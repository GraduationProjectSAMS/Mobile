import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/cards/domain/repositories/cards_repo.dart';

import '../../../../core/errors/failure.dart';

class AddToCardUseCase {
  final CardsRepo _cardsRepo;

  AddToCardUseCase(this._cardsRepo);

  Future<Either<Failure, void>> call(
      {required dynamic productId, required String type, int quantity = 1})async{
    return  _cardsRepo.addToCard(
        productId: productId, type: type, quantity: quantity);
  }

}