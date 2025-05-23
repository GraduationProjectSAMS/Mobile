import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../utilities/resources/app_colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.text, required this.onPressed});
final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  TextButton.icon(

      style: TextButton.styleFrom(
        backgroundColor: AppColors.white, // Light background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed:onPressed,
      icon: Icon(
        Icons.add,
        color: AppColors.primary,
        size: 20.sp,
      ),
      label: Text(
        text,
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
