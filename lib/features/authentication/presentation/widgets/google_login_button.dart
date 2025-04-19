import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/utilities/resources/app_assets.dart';
import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.googleLogo,
              height: 25.sp, width: 25.sp, fit: BoxFit.cover),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: AppStyles.textStyle14,
          ),
        ],
      ),
    );
  }
}
