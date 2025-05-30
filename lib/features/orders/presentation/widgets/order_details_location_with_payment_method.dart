import 'package:flutter/material.dart';

import '../../../../core/utilities/resources/app_styles.dart';
import '../../../payment/presentation/widgets/payment_method.dart';
import '../../domain/entities/order_entity.dart';

class OrderDetailsLocationWithPaymentMethod extends StatelessWidget {
  const OrderDetailsLocationWithPaymentMethod(
      {super.key, required this.entity});

  final OrderEntity entity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _InfoRow(
              icon: Icons.location_on,
              color: Colors.red,
              text: entity.shippingAddress,
            ),
            const SizedBox(height: 10),
            _InfoRow(
              icon: PaymentMethod.fromValue(entity.paymentMethod).icon,
              color: Colors.green,
              text: PaymentMethod.fromValue(entity.paymentMethod).label,
            ),
            if (entity.orderNotes.isNotEmpty) ...[
              const SizedBox(height: 10),
              _InfoRow(
                maxLines: 2,
                icon: Icons.article_outlined,
                color: Colors.green,
                text: entity.orderNotes,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final int maxLines;

  const _InfoRow({
    required this.icon,
    required this.color,
    required this.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            maxLines: maxLines,
            textAlign: TextAlign.end,
            style: AppStyles.defaultStyle,
          ),
        ),
      ],
    );
  }
}
