import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../domain/entities/order_entity.dart';
import 'order_details_location_with_payment_method.dart';
import 'order_details_product_list.dart';
import 'order_details_status_with_date.dart';
import 'order_summary.dart';

class OrderDetailsDesktopDesign extends StatelessWidget {
  const OrderDetailsDesktopDesign({super.key, required this.entity});

  final OrderEntity entity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  OrderDetailsStatusWithDate(
                    entity: entity,
                  ),
                  const SizedBox(height: 20),
                  OrderDetailsLocationWithPaymentMethod(
                    entity: entity,
                  ),
                  const SizedBox(height: 20),
                  OrderSummary.card(
                    entity: entity,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: AnimationLimiter(
          child: CustomScrollView(
            slivers: [
              OrderDetailsProductList(
                products: entity.products,
              ),
            ],
          ),
        ))
      ],
    );
  }
}
