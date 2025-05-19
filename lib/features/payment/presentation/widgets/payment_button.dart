import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/functions/my_toast.dart';
import 'package:graduation_project/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/widgets/my_button_widget.dart';
import '../../../orders/presentation/widgets/order_success_dialog_content.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      builder: (context, state) {
        final paymentCubit = context.read<PaymentCubit>();
        return MyButton(
            isLoading: state is PaymentLoadingState,
            onPressed: paymentCubit.onTapByNow,
            text: AppStrings.payNow);
      },
      listener: (BuildContext context, PaymentStates state) {
        if (state is PaymentSuccessState) {
          if (state.payMobEntity == null) {
            context.navigateAndRemoveUntil(pageName: AppRoutes.homeLayout);
            Future.delayed(const Duration(milliseconds: 500), () {
              if (context.mounted) showOrderSuccessDialog(context);
            });
          } else {
            final paymentCubit = context.read<PaymentCubit>();
            context.navigateTo(pageName: AppRoutes.payMobCard, arguments: (
              payMobEntity: state.payMobEntity,
              cubit: paymentCubit
            ));
          }
        } else if (state is PaymentErrorState) {
          myToast(msg: state.errorMessage, state: ToastStates.error);
        }
      },
    );
  }
}
