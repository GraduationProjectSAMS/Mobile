import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/widgets/my_app_bar.dart';
import 'package:graduation_project/features/payment/presentation/widgets/payment_method_item.dart';

import '../manager/payment_cubit/payment_cubit.dart';
import 'location_forms.dart';
import 'payment_button.dart';
import 'payment_info.dart';

class PaymentScreenBody extends StatelessWidget {
  const PaymentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: MyAppBar(title: AppStrings.payment),
                ),
                PaymentMethodItem(
                  onChangePaymentMethod:
                      context.read<PaymentCubit>().setPaymentMethod,
                ),
                const SizedBox(height: 20),
                const LocationForms(),
                const SizedBox(height: 10),
                const PaymentInfo(),
                const Expanded(child: SizedBox(height: 20)),
                const PaymentButton(),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
