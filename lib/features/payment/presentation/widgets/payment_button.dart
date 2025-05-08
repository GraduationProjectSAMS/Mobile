import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/widgets/my_button_widget.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      builder: (context, state) {
        final paymentCubit = context.read<PaymentCubit>();
        return MyButton(
            isLoading: state is PaymentLoadingState,
            onPressed: paymentCubit.getPaymentKey, text: AppStrings.payNow);
      }, listener: (BuildContext context, PaymentStates state) {
        if(state is PaymentSuccessState){
          context.navigateTo(pageName: AppRoutes.payMobCard,arguments: state.payMobEntity);
        }
    },
    );
  }
}
