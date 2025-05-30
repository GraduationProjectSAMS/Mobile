import 'package:flutter/material.dart';

import '../../../../core/utilities/resources/app_constants.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../../domain/entities/order_entity.dart';

class OrderSummary extends StatelessWidget {
  final bool _asCard;
  final OrderEntity entity;

  // default constructor: uses a Container
  const OrderSummary({super.key, required this.entity}) : _asCard = false;

  // named constructor: uses a Card
  const OrderSummary.card({super.key, required this.entity}) : _asCard = true;

  @override
  Widget build(BuildContext context) {
    // the shared content (padding + children)
    final content = Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LabelValueRow(label: 'Price', value: entity.totalPrice),
          const SizedBox(height: 10),
          _LabelValueRow(
              label: 'Shipping', value: AppConstants.shippingCost.toString()),
          const SizedBox(height: 10),
          _LabelValueRow(
            label: 'Total',
            value: ((num.tryParse(entity.totalPrice) ?? 0) +
                    AppConstants.shippingCost)
                .toString(),
            textStyle: AppStyles.textStyle20,
          ),
        ],
      ),
    );

    if (_asCard) {
      return Card(
        child: content,
      );
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: content,
    );
  }
}

class _LabelValueRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? textStyle;

  const _LabelValueRow({
    required this.label,
    required this.value,
    this.textStyle,

    // default here
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textStyle ?? AppStyles.textStyle16),
        Text('$value EGP', style: textStyle ?? AppStyles.textStyle16),
      ],
    );
  }
}
