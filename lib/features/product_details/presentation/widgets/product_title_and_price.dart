import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../../../home/domain/entities/product_entity.dart';

class ProductTitleAndPrice extends StatelessWidget {
  const ProductTitleAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as ({
      ProductEntity entity,
      StatelessElement context,
    bool isOffer,
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          arg.entity.name,
          style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            if(arg.isOffer)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Theme : ${arg.entity.offerTheme}',
                  style: AppStyles.textStyle14.copyWith(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  )
                ),
                Text(
                  'Quantity : ${arg.entity.maxQuantity}',
                  style: AppStyles.textStyle14.copyWith(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  )
                ),
              ],
            )
            else
            Text(
              '${arg.entity.productCategory} , ${arg.entity.productAesthetic} , ${arg.entity.productRoom}',
              style: AppStyles.textStyle14.copyWith(
                color: Colors.green.shade800,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'EGP ${arg.entity.price}',
                    style: AppStyles.textStyle18.copyWith(
                      color: Colors.green.shade800,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(width: 5),
                  ),
                  TextSpan(
                    text: '250',
                    style: AppStyles.textStyle14.copyWith(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
