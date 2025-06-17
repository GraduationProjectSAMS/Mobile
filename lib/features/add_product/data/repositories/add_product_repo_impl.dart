import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/failure.dart';

import '../../domain/repositories/add_product_repo.dart';
import '../data_sources/add_product_remote_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  final AddProductRemoteRepo remoteRepo;

  AddProductRepoImpl(this.remoteRepo);

  @override
  Future<Either<Failure, void>> addProduct(
      {required Map<String, dynamic> data,
      void Function(int, int)? onSendProgress}) async {
    try {
      await remoteRepo.addProduct(data: data, onSendProgress: onSendProgress);
      return const Right(null);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }

// Implement repository methods here
}
