part of 'get_orders_cubit.dart';

@immutable
sealed class GetOrdersStates {}

final class GetOrdersLoading extends GetOrdersStates {}

final class GetOrdersSuccess extends GetOrdersStates {}

final class GetOrdersError extends GetOrdersStates {
  final String error;

  GetOrdersError(this.error);
}

final class ChangeOrderStatusLoading extends GetOrdersStates {}

final class ChangeOrderStatusSuccess extends GetOrdersStates {
}

final class ChangeOrderStatusError extends GetOrdersStates {
  final String error;

  ChangeOrderStatusError(this.error);
}