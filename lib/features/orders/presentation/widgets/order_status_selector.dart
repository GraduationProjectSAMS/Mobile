import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/features/orders/presentation/widgets/order_details_status_bar.dart';

import '../../../../core/utilities/resources/app_styles.dart';

class OrderStatusSelector extends StatefulWidget {
  final Function(String?) onStatusSelected; // String? to allow null

  const OrderStatusSelector({super.key, required this.onStatusSelected});

  @override
  State<OrderStatusSelector> createState() => _OrderStatusSelectorState();
}

class _OrderStatusSelectorState extends State<OrderStatusSelector> {
  final List<String> statuses = [
    OrderStatus.ordered.label,
    OrderStatus.received.label,
    OrderStatus.onTheWay.label,
    OrderStatus.delivered.label,
  ];
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: statuses.map((status) {
          final isSelected = selectedStatus == status;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: ChoiceChip(
              backgroundColor: AppColors.white,
              selectedColor: AppColors.primary,
              checkmarkColor: AppColors.white,
              labelStyle: AppStyles.textStyle15.copyWith(
                color: isSelected ? AppColors.white : AppColors.black,
              ),
              label: Text(status),
              selected: isSelected,
              onSelected: (_) {
                setState(() {
                  selectedStatus = isSelected ? null : status;
                });
                widget.onStatusSelected(selectedStatus);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
