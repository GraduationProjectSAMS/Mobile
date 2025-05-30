part of 'payment_cubit.dart';

@immutable
sealed class PaymentStates {}

final class PaymentInitial extends PaymentStates {}

final class PaymentLoadingState extends PaymentStates {}

final class PaymentSuccessState extends PaymentStates {
  final PayMobEntity? payMobEntity;

  PaymentSuccessState(this.payMobEntity);
}

final class PaymentErrorState extends PaymentStates {
  final String errorMessage;

  PaymentErrorState(this.errorMessage);
}

final class GetCurrentOrderLocationState extends PaymentStates {
  final OrderLocationEntity orderLocationEntity;

  GetCurrentOrderLocationState(this.orderLocationEntity);
}
