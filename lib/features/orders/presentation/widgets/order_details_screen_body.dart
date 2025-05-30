import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';

import 'order_details_bloc_builder.dart';

class OrderDetailsScreenBody extends StatelessWidget {
  const OrderDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: MyBackButton(),
          ),
          Expanded(child: OrderDetailsBlocBuilder()),
        ],
      ),
    );
  }
}
