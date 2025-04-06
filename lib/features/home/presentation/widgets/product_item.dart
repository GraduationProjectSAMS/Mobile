

import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/my_cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key,  this.width,  this.height});
final double? width;
final double? height;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    MyCachedNetworkImage(
                      fit: BoxFit.fill,
                        imageUrl:
                            "https://images.pexels.com/photos/3757055/pexels-photo-3757055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),

                    Positioned(
                      top: 5,
                      right: 5,
                      child: Skeleton.ignore(
                        child:  CircleAvatar(
                          radius: 18.sp,
                          backgroundColor: AppColors.white.withOpacity(0.5),
                          child: Icon(
                            Icons.favorite_border,
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB( 8, 0, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'sofa with pillows',
                    style: AppStyles.textStyle15.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Product Description',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyle12.copyWith(color: AppColors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        alignment: AlignmentDirectional.topStart,
                        fit: BoxFit.scaleDown,
                        child: Text(
                        maxLines: 1,
                          '\$ 1000',
                          style: AppStyles.textStyle20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Skeleton.shade(
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    )

                  ],
                )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
