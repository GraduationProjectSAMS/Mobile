part of 'get_orders_cubit.dart';

@immutable
sealed class GetOrdersStates {}

final class GetOrdersLoading extends GetOrdersStates {}

final class GetOrdersSuccess extends GetOrdersStates {
  final List<OrderEntity> orders;

  GetOrdersSuccess(this.orders);
}

final class GetOrdersError extends GetOrdersStates {
  final String error;

  GetOrdersError(this.error);
}
