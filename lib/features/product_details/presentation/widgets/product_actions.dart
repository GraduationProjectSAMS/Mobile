import 'package:flutter/material.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_counter_widget.dart';

import 'product_color_selector.dart';

class ProductActions extends StatelessWidget {
  const ProductActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductColorSelector(
          availableColors: const [
            Color(0xFFC2C0C0),
            Color(0xFF6B4F3B),
            Color(0xFF3A3A3A),
          ],
          initialColor: const Color(0xFFC2C0C0),
          onColorSelected: (color) {

          },
        ),
        ProductCounter(
          onChanged: (value) {
            // Handle value change
          },
        ),
      ],
    );
  }
}