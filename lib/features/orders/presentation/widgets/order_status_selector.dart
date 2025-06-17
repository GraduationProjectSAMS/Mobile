import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/features/orders/presentation/widgets/order_details_status_bar.dart';

import '../../../../core/utilities/resources/app_styles.dart';

class OrderStatusSelector extends StatefulWidget {
  final Function(OrderStatus?) onStatusSelected; // OrderStatus? to allow null
  final OrderStatus? initialStatus; // Initial status can be null

  const OrderStatusSelector({
    super.key,
    required this.onStatusSelected,
    this.initialStatus,
  });

  @override
  State<OrderStatusSelector> createState() => _OrderStatusSelectorState();
}

class _OrderStatusSelectorState extends State<OrderStatusSelector> {
  final List<OrderStatus> statuses = [
    OrderStatus.ordered,
    OrderStatus.received,
    OrderStatus.onTheWay,
    OrderStatus.delivered,
  ];
  OrderStatus? selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.initialStatus;
  }

  @override
  void didUpdateWidget(covariant OrderStatusSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialStatus != widget.initialStatus) {
      selectedStatus = widget.initialStatus;
    }
  }

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
              label: Text(status.label),
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
