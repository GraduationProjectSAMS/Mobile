import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/failure.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';

import '../../domain/repositories/orders_repo.dart';
import '../data_sources/orders_remote_repo.dart';

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

// Implement repository methods here
}
