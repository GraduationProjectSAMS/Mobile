import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/cards_repo.dart';

class DeleteCardUseCase {
  final CardsRepo _cardsRepo;

  DeleteCardUseCase(this._cardsRepo);

  Future<Either<Failure, void>> call(
      {required dynamic productId, required String type}) async {
    return _cardsRepo.removeFromCard(productId: productId, type: type);
  }
}
