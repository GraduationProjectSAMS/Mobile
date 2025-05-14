part of 'payment_cubit.dart';

@immutable
sealed class PaymentStates {}

final class PaymentInitial extends PaymentStates {}

final class PaymentLoadingState extends PaymentStates {}

final class PaymentSuccessState extends PaymentStates {
  final PayMobEntity payMobEntity;

  PaymentSuccessState(this.payMobEntity);
}

final class PaymentErrorState extends PaymentStates {
  final String errorMessage;

  PaymentErrorState(this.errorMessage);
}

enum PaymentMethod {
  cash,
  visa,
}

PaymentMethod getPaymentMethodFromIndex(int index) {
  switch (index) {
    case 0:
      return PaymentMethod.cash;
    case 1:
      return PaymentMethod.visa;
    default:
      return PaymentMethod.cash;
  }
}
