import 'package:flutter/material.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';

import '../../../../core/utilities/functions/date_time_format.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import 'order_details_status_bar.dart';

class OrderDetailsStatusWithDate extends StatelessWidget {
  const OrderDetailsStatusWithDate({super.key, required this.entity});

  final OrderEntity entity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text('order ID${entity.hashId}', style: AppStyles.textStyle20),
            const SizedBox(height: 20),
            _LabelValueRow(
              label: 'Orders Date',
              value: formatDateTime(entity.orderDate),
            ),
            const SizedBox(height: 10),
            _LabelValueRow(
              label: 'Estimated delivery',
              value: entity.deliveryDate,
            ),
            const SizedBox(height: 10),
            OrderDetailsStatusBar(
              deliveryDate: entity.deliveryDate,
              orderDate: entity.orderDate,
              currentStatus: OrderStatus.fromValue(entity.orderStatus),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabelValueRow extends StatelessWidget {
  final String label;
  final String value;

  const _LabelValueRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppStyles.textStyle14),
        Text(value, style: AppStyles.defaultStyle),
      ],
    );
  }
}
