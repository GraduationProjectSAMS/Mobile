import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/my_app_bar.dart';
import 'package:graduation_project/features/payment/presentation/widgets/payment_method_item.dart';

import '../manager/payment_cubit/payment_cubit.dart';
import 'location_forms.dart';
import 'payment_button.dart';

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
                const SizedBox(height: 20),
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

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final arg= ModalRoute.of(context)?.settings.arguments as ({
      num totalPrice,
    });
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Column(
          children: [
            PaymentInfoItem(
              title: 'Product Price',
              price: arg.totalPrice.toString(),
            ),
            const PaymentInfoItem(
              title: 'Shipping Price',
              price: '10',
            ),
            const PaymentInfoItem(
              title: ' discount',
              price: '0',
            ),
            const PaymentInfoItem(
              title: 'Total Price',
              price: '110',
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentInfoItem extends StatelessWidget {
  const PaymentInfoItem({super.key, required this.title, required this.price});

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyles.textStyle14),
          Text('$price EGP',
              style:
                  AppStyles.textStyle14.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
