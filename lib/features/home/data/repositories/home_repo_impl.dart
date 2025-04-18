import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/failure.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

import '../../../../core/errors/server_failure.dart';
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
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getOffers() async {
    try {
      final offers = await remoteRepo.getOffers();
      return Right(offers);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
