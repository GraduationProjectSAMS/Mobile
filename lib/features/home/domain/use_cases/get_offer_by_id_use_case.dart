import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repo.dart';

class GetOfferByIdUseCase{

  final HomeRepo _homeRepo;

  GetOfferByIdUseCase(this._homeRepo);
  Future<Either<Failure, ProductEntity>> call(int id){
    return _homeRepo.getOfferById(id);
  }


}

