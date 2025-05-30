import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/home_repo.dart';

class AddOfferUseCase {
  final HomeRepo _homeRepo;

  AddOfferUseCase(this._homeRepo);

  Future<Either<Failure, void>> call(
      {required Map<String, dynamic> offerData,
      void Function(int, int)? onSendProgress}) async {
    return _homeRepo.addOffer(
        offerData: offerData, onSendProgress: onSendProgress);
  }
}
