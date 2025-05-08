import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/pay_mob_request_model.dart';
import '../../../domain/entities/pay_mob_entity.dart';
import '../../../domain/use_cases/get_pay_mob_client_key_use_case.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit({required GetPayMobClientKeyUseCase getPayMobClientKeyUseCase})
      : _getPayMobClientKeyUseCase = getPayMobClientKeyUseCase,
        super(PaymentInitial());
  PaymentMethod paymentMethod = PaymentMethod.cash;
  final GetPayMobClientKeyUseCase _getPayMobClientKeyUseCase;

  Future<void> getPaymentKey() async {
    emit(PaymentLoadingState());
    final result = await _getPayMobClientKeyUseCase(
        payMobRequestModel: PayMobRequestModel(
            amount: 5000,
            currency: 'EGP',
            paymentMethods: [5076561, 'card'],
            billingData: BillingData(
                firstName: 'yousef',
                lastName: 'nageh',
                phoneNumber: '201234567890')));
    result.fold(
      (failure) => emit(PaymentErrorState(failure.errorMessage)),
      (payMobEntity) {
        emit(PaymentSuccessState(payMobEntity));

      },
    );
  }

  void setPaymentMethod(PaymentMethod method) {
    paymentMethod = method;
  }

  final formKey = GlobalKey<FormState>();
}
