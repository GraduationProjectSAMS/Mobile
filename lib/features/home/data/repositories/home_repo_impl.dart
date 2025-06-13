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
  Future<Either<Failure, void>> addOffer(
      {required Map<String, dynamic> offerData,
      void Function(int, int)? onSendProgress}) async {
    try {
      await remoteRepo.addOffer(
          offerData: offerData, onSendProgress: onSendProgress);
      return const Right(null);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getOfferById(int id) async {
    try {
      final offer = await remoteRepo.getOfferById(id);
      return Right(offer);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async {
    try {
      final product = await remoteRepo.getProductById(id);
      return Right(product);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
      getProductRecommendations() async {
    try {
      final recommendations = await remoteRepo.getProductRecommendations();
      return Right(recommendations);
    } catch (e) {
      return Left(appServerFailure(e));
    }
  }
}
