import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/my_cached_network_image.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/routes/app_route.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.width, this.height, required this.model});

  final ProductEntity model;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
     hoverColor: AppColors.offPrimary,

      borderRadius: BorderRadius.circular(10),
      onTap: () {
        context.navigateTo(pageName: AppRoutes.productDetails);
      },
      child: Card(
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
                          fit: BoxFit.fill, imageUrl: model.imageUrl),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Skeleton.ignore(
                          child: CircleAvatar(
                            radius: 18.sp,
                            backgroundColor: AppColors.white.withOpacity(0.5),
                            child: const Icon(
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
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      model.name,
                      style: AppStyles.textStyle15
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (model.description.isNotEmpty)
                      Text(
                        model.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle12
                            .copyWith(color: AppColors.grey),
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            alignment: AlignmentDirectional.topStart,
                            fit: BoxFit.scaleDown,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'EGP ',
                                    style: AppStyles
                                        .textStyle14, // Smaller font for EGP
                                  ),
                                  TextSpan(
                                    text: '${model.price}',
                                    style: AppStyles.textStyle18.copyWith(
                                        fontWeight: FontWeight
                                            .w600), // Original font for price
                                  ),
                                ],
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        const SizedBox(
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
                              child: const Icon(
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
      ),
    );
  }
}
