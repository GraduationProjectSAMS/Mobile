import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/failure.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_remote_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteRepo remoteRepo;

  HomeRepoImpl(this.remoteRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final products = await remoteRepo.getProducts();
      return Right(products);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getOffers() async {
    try {
      final offers = await remoteRepo.getOffers();
      return Right(offers);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> addOffer({
    required Map<String, dynamic> offerData,
  }) async {
    try {
      await remoteRepo.addOffer(offerData: offerData);
      return const Right(null);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }
}
