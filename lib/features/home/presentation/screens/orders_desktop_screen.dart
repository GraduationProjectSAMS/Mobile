import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

import '../../../orders/presentation/widgets/get_orders_bloc_builder.dart';

import '../../../orders/presentation/widgets/order_status_selector_bloc_builder.dart';

class OrdersDesktopScreen extends StatelessWidget {
  const OrdersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                AppStrings.allOffers,
                style: AppStyles.textStyle20,
              ),
              const Spacer(),
            const OrderStatusSelectorBlocBuilder(

              ),
              const Spacer(),
            ],
          ),
        ),
        const Expanded(
          child: GetOrdersBlocBuilder(),
        ),
      ],
    );
  }
}
