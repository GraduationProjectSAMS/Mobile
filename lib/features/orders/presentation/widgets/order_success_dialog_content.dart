import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/functions/show_dialog.dart';

void showOrderSuccessDialog(BuildContext context) =>
    showAppDialog(context: context, child: const OrderSuccessDialogContent());

class OrderSuccessDialogContent extends StatelessWidget {
  const OrderSuccessDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check_circle_outline, color: Colors.green, size: 64),
        SizedBox(height: 16),
        Text(
          'Order Created Successfully !',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Your order has been placed and is now being processed.',
          style: TextStyle(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
