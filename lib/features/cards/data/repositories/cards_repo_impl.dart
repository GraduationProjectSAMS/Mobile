import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/failure.dart';

import '../../../../core/errors/server_failure.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../../domain/repositories/cards_repo.dart';
import '../data_sources/cards_remote_repo.dart';

class CardsRepoImpl implements CardsRepo {
  final CardsRemoteRepo remoteRepo;

  CardsRepoImpl(this.remoteRepo);

  @override
  Future<Either<Failure, void>> addToCard(
      {required productId, required String type, int quantity = 1}) async {
    try {
      await remoteRepo.addToCard(
          productId: productId, type: type, quantity: quantity);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getCards() async {
    try {
      final cards = await remoteRepo.getCards();
      return Right(cards);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCard(
      {required productId, required String type}) async {
    try {
      await remoteRepo.removeFromCard(productId: productId, type: type);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
// Implement repository methods here
}
