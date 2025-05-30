import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';

import 'order_details_location_with_payment_method.dart';
import 'order_details_product_list.dart';
import 'order_details_status_with_date.dart';
import 'order_summary.dart';

class OrderDetailsMobileDesign extends StatelessWidget {
  const OrderDetailsMobileDesign({super.key, required this.entity});

  final OrderEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailsStatusWithDate(
                        entity: entity,
                      ),
                      OrderDetailsLocationWithPaymentMethod(
                        entity: entity,
                      ),

                      // for price and shipping and total
                    ],
                  )),
                  OrderDetailsProductList(
                    products: entity.products,
                  ),
                ],
              ),
            ),
          ),
        ),
        OrderSummary(
          entity: entity,
        )
      ],
    );
  }
}
