part of 'payment_cubit.dart';

@immutable
sealed class PaymentStates {}

final class PaymentInitial extends PaymentStates {}

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
