import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class AddProductRepo {
  Future<Either<Failure, void>> addProduct(
      {required Map<String, dynamic> data,
      void Function(int, int)? onSendProgress});
}
