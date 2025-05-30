import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../../../../core/widgets/my_cached_network_image.dart';

class OrderDetailsProductItem extends StatelessWidget {
  const OrderDetailsProductItem({super.key, required this.entity});

  final ProductEntity entity;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Stack(
        children: [
          Column(
            children: [
              const Expanded(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MyCachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: AppConstants.kNullProductImage)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      entity.name,
                      style: AppStyles.textStyle15
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (entity.description.isNotEmpty)
                      Text(
                        entity.description,
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
                                    text: '${entity.price}',
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
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Skeleton.shade(
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: FittedBox(
                  child: Text(
                    ' ${entity.carQuantity}',
                    style: AppStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
