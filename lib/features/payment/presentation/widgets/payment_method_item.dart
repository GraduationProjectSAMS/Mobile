import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/features/payment/presentation/widgets/payment_method.dart';

import '../../../../core/utilities/resources/app_colors.dart';

class PaymentMethodItem extends StatefulWidget {
  const PaymentMethodItem({super.key, required this.onChangePaymentMethod});

  final ValueChanged<PaymentMethod> onChangePaymentMethod;

  @override
  State<PaymentMethodItem> createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  final title = [
    AppStrings.cash,
    AppStrings.visa,
  ];

  final icons = [
    Icons.payments_outlined,
    Icons.credit_card,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        title.length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.onChangePaymentMethod(PaymentMethod.fromIndex(index));
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selectedIndex == index
                          ? AppColors.primary
                          : Colors.transparent,
                      width: 1.5,
                    ),
                    boxShadow: selectedIndex == index
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withValues( alpha: 0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ]
                        : [],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        icons[index],
                        size: 50,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title[index],
                        style: AppStyles.textStyle20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
