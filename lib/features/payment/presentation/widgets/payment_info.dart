import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

import '../manager/payment_cubit/payment_cubit.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaymentCubit>();
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            PaymentInfoItem(
              title: 'Product Price',
              price: cubit.paymentAmount.toString(),
            ),
            const PaymentInfoItem(
              title: 'Shipping Price',
              price: '100',
            ),
            const PaymentInfoItem(
              title: ' discount',
              price: '0',
            ),
            PaymentInfoItem(
              title: 'Total Price',
              price: (cubit.paymentAmount + 100).toString(),
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
