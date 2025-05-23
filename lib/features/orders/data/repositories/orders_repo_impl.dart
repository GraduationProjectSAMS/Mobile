import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/failure.dart';
import 'package:graduation_project/features/orders/data/models/order_location_model.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';
import 'package:graduation_project/features/orders/domain/entities/order_location_entity.dart';

import '../../domain/repositories/orders_repo.dart';
import '../data_sources/orders_remote_repo.dart';
import '../models/create_order_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteRepo remoteRepo;

  OrdersRepoImpl(this.remoteRepo);

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders(
      {String? orderType}) async {
    try {
      final orders = await remoteRepo.getOrders(orderType: orderType);
      return Right(orders);
    } on Exception catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> setOrderLocation(
      {required OrderLocationModel orderLocationModel}) async {
    try {
      await remoteRepo.setOrderLocation(orderLocationModel: orderLocationModel);
      return const Right(null);
    } on Exception catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, OrderLocationEntity>> getOrderLocations() async {
    try {
      final orderLocation = await remoteRepo.getOrderLocations();
      return Right(orderLocation);
    } on Exception catch (e) {
      return Left(appServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> createOrder(
      {required CreateOrderModel createOrderModel}) async {
    try {
      await remoteRepo.createOrder(createOrderModel: createOrderModel);
      return const Right(null);
    } on Exception catch (e) {
      return Left(appServerFailure(e));
    }
  }

// Implement repository methods here
}
