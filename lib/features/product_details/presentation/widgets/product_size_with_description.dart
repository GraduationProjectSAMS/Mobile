import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';

class ProductSizeWithDescription extends StatelessWidget {
  const ProductSizeWithDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            '300 x 200 cm, 100 cm Height',
            style: AppStyles.textStyle14.copyWith(
              color: AppColors.black.withValues(alpha: 0.6),
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Divider(
          color: AppColors.black.withValues(alpha: 0.3),
          thickness: 1,
        ),
        const SizedBox(height: 5),
        Text(
          'Description',
          style: AppStyles.textStyle14.copyWith(
            color: AppColors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...',
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.textStyle14.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
