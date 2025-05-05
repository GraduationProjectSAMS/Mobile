import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/product_entity.dart';

abstract class AddProductRepo {
  Future<Either<Failure, void>> addProduct({required Map<String, dynamic> data});
}
