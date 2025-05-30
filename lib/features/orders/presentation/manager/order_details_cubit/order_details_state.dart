part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsLoading extends OrderDetailsState {}

final class OrderDetailsSuccess extends OrderDetailsState {
  final OrderEntity entity;

  OrderDetailsSuccess(this.entity);
}

final class OrderDetailsError extends OrderDetailsState {
  final String message;

  OrderDetailsError(this.message);
}
