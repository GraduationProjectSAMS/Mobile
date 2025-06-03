import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/features/product_details/presentation/screens/product_details_screen.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = context.productDetailsArgs;
    if (arg.entity.type == AppConstants.offers) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RatingBarIndicator(
              rating: 4.5,
              itemBuilder: (context, index) =>
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemSize: 20.sp,
              unratedColor: AppColors.grey.withValues(alpha: 0.3),
            ),
            const SizedBox(width: 5),
            Text(
              '4.5',
              style: AppStyles.textStyle14.copyWith(
                color: AppColors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '(100)',
              style: AppStyles.textStyle14.copyWith(
                color: AppColors.grey,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
