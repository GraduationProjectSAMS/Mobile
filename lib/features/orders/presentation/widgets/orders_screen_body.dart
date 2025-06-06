import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/widgets/my_app_bar.dart';

import 'get_orders_bloc_builder.dart';
import 'order_status_selector.dart';
import 'order_status_selector_bloc_builder.dart';

class OrdersScreenBody extends StatelessWidget {
  const OrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const MyAppBar(title: AppStrings.myOrders),
          const SizedBox(
            height: 10,
          ),
          OrderStatusSelectorBlocBuilder(),
          const SizedBox(
            height: 10,
          ),
          const Expanded(child: GetOrdersBlocBuilder()),
        ],
      ),
    ));
  }
}
