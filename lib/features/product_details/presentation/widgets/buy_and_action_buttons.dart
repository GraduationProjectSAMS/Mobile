import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/widgets/my_button_widget.dart';

class BuyAndActionButtons extends StatelessWidget {
  const BuyAndActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ButtonWidget(
            height: 45,
            label: 'Buy Now',
            onPressed: () {},
            isShowArrow: true,
            labelFontSize: 15.sp,
            borderRadius: 50,
          ),
        ),
        const SizedBox(width: 10),

        const ActionIcon(icon: Icons.favorite_border),
        const SizedBox(width: 10),
        const ActionIcon(icon: Icons.add_shopping_cart),
      ],
    );
  }
}

class ActionIcon extends StatelessWidget {
  final IconData icon;
  const ActionIcon({super.key, required this.icon,  this.iconColor});
final Color ?iconColor ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.5),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 24.sp,
      ),
    );
  }
}
