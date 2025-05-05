import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';

import '../../../../core/utilities/resources/app_styles.dart';

class HomeTextTitle extends StatelessWidget {
  const HomeTextTitle({super.key, required this.title, required this.onTap});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.textStyle18.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton.icon(
              icon: Text(
                AppStrings.viewAll,
                style: AppStyles.defaultStyle,
              ),
              onPressed: onTap,
              label: const Icon(
                Icons.arrow_right,
                size: 20,
              )),
        ],
      ),
    );
  }
}
