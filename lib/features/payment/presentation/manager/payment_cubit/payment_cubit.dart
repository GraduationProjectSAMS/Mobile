import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitial());
  PaymentMethod paymentMethod = PaymentMethod.cash;

  void setPaymentMethod(PaymentMethod method) {
    paymentMethod = method;
  }

  final formKey = GlobalKey<FormState>();
}
