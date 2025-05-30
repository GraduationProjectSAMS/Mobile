import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'order_status.dart';

export 'order_status.dart';

/// The four possible order states.

/// A little data class to hold label + date for each step.
class _StepData {
  final OrderStatus status;
  final String label;
  final String date;

  const _StepData(this.status, this.label, this.date);
}

class OrderDetailsStatusBar extends StatelessWidget {
  final OrderStatus currentStatus;
  final String orderDate;
  final String deliveryDate;

  const OrderDetailsStatusBar(
      {super.key,
      required this.currentStatus,
      required this.orderDate,
      required this.deliveryDate});

  List<_StepData> get _steps => [
        _StepData(OrderStatus.ordered, OrderStatus.ordered.label,
            formatWithNewline(orderDate)),
        _StepData(OrderStatus.received, OrderStatus.received.label, ''),
        _StepData(OrderStatus.onTheWay, OrderStatus.onTheWay.label, ''),
        _StepData(OrderStatus.delivered, OrderStatus.delivered.label,
            formatWithNewline(deliveryDate)),
      ];

  Color _colorForStep(int stepIndex) => stepIndex <= currentStatus.index
      ? AppColors.primary
      : Colors.grey.shade400;

  AlignmentDirectional setAlign(int index) {
    if (index == 0) {
      return AlignmentDirectional.centerStart;
    } else if (index == _steps.length - 1) {
      return AlignmentDirectional.centerEnd;
    }
    return AlignmentDirectional.center;
  }

  TextAlign setTextAlign(int index) {
    if (index == 0) {
      return TextAlign.start;
    } else if (index == _steps.length - 1) {
      return TextAlign.end;
    }
    return TextAlign.center;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // --- 1) Labels row ---
        Row(
          children: List.generate(_steps.length, (i) {
            final step = _steps[i];
            return Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: setAlign(i),
                child: Text(
                  step.label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: _colorForStep(i),
                  ),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: 8),

        // --- 2) Circles + connectors row ---
        // We have (_steps.length * 2 - 1) total widgets: connector, circle, connector, circle…
        Skeleton.shade(
          child: Row(
            children: List.generate(_steps.length * 2 - 1, (idx) {
              if (idx.isOdd) {
                // connector between circles
                final stepIndex = (idx ~/ 2) + 1;
                return Expanded(
                  child: Container(
                    height: 4,
                    color: _colorForStep(stepIndex),
                  ),
                );
              } else {
                // the circle itself
                final stepIndex = idx ~/ 2;
                return Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _colorForStep(stepIndex),
                    shape: BoxShape.circle,
                  ),
                );
              }
            }),
          ),
        ),

        const SizedBox(height: 8),

        // --- 3) Dates row ---
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(_steps.length, (i) {
            final step = _steps[i];
            return Expanded(
              child: Text(
                step.date,
                textAlign: setTextAlign(i),
                style: TextStyle(
                  color:
                      i <= currentStatus.index ? Colors.black87 : Colors.grey,
                  fontSize: 12,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  String formatWithNewline(String? input) {
    // 0) guard empty / null
    if (input == null || input.trim().isEmpty) {
      return '';
    }

    try {
      // 1) pick the right parser
      final hasTime = input.contains(' ');
      final parser = hasTime
          ? DateFormat('dd-MM-yyyy HH:mm:ss')
          : DateFormat('dd-MM-yyyy');

      final date = parser.parse(input);

      // 2) format weekday + day+abbr-month
      final weekday = DateFormat('EEEE').format(date); // e.g. “Thursday”
      final dayMonth = DateFormat('dd MMM').format(date); // e.g. “29 May”

      // 3) join with newline
      return '$weekday\n$dayMonth';
    } catch (e) {
      // parse failed or any other error
      return '';
    }
  }
}
