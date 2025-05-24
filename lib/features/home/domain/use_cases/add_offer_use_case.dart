import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/home_repo.dart';

class AddOfferUseCase {
  final HomeRepo _homeRepo;

  AddOfferUseCase(this._homeRepo);

  Future<Either<Failure, void>> call(Map<String,dynamic> offerData) async {
    return _homeRepo.addOffer(offerData: offerData);
  }
}
