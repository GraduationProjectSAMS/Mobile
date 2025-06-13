import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/product_details/presentation/screens/product_details_screen.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_constants.dart';
import '../../../../core/utilities/resources/app_styles.dart';

class ProductSizeWithDescription extends StatelessWidget {
  const ProductSizeWithDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = context.productDetailsArgs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (arg.entity.type != AppConstants.offers)
    ...[
      if(arg.entity.length!=0)
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          '${arg.entity.length} x ${arg.entity.width} cm, ${arg.entity.height} cm Height',
          style: AppStyles.textStyle14.copyWith(
            color: AppColors.black.withValues(alpha: 0.6),
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Text('Quantity : ${arg.entity.maxQuantity}',
          style: AppStyles.textStyle14.copyWith(
            color: Colors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          )),
    ],

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
          arg.entity.description,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.textStyle14.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
