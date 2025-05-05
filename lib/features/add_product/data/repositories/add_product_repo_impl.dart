import 'package:dartz/dartz.dart';

import 'package:graduation_project/core/errors/failure.dart';

import '../../../../core/errors/server_failure.dart';
import '../../domain/repositories/add_product_repo.dart';
import '../data_sources/add_product_remote_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  final AddProductRemoteRepo remoteRepo;

  AddProductRepoImpl(this.remoteRepo);

  @override
  Future<Either<Failure, void>> addProduct({required Map<String, dynamic> data}) async {
    try {
      await remoteRepo.addProduct(data: data);
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // Implement repository methods here
}
