import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/add_product_repo.dart';

class AddProductUseCase {
  final AddProductRepo addProductRepo;

  AddProductUseCase(this.addProductRepo);

  Future<Either<Failure, void>> call(
      {required Map<String, dynamic> data,
      void Function(int, int)? onSendProgress}) async {
    return addProductRepo.addProduct(
        data: data, onSendProgress: onSendProgress);
  }
}
