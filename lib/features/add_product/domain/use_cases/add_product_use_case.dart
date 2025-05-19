import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/add_product_repo.dart';

class AddProductUseCase {
  final AddProductRepo addProductRepo;

  AddProductUseCase(this.addProductRepo);

  Future<Either<Failure, void>> call(Map<String,dynamic> data) async {
    return addProductRepo.addProduct(data: data);
  }
}
