import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/my_cached_network_image.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/routes/app_route.dart';
import '../../../favorites/presentation/manager/add_favorite_cubit/add_favorite_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.width, this.height, required this.model});

  final ProductEntity model;
  final double? width;
  final double? height;

  @override
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
                          child:
                              BlocBuilder<AddFavoriteCubit, AddFavoriteStates>(
                            builder: (context, state) {
                              final cubit = context.read<AddFavoriteCubit>();
                              final isFavorite = cubit.productsKeys[
                                      '${model.id}${model.type}'] ??
                                  false;

                              return InkWell(
                                onTap: () => cubit.toggleFavoriteBackEnd(model),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white
                                        .withAlpha(isFavorite ? 255 : 100),
                                  ),
                                  width: 36.sp,
                                  height: 36.sp,
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      transitionBuilder: (child, animation) =>
                                          ScaleTransition(
                                              scale: animation, child: child),
                                      child: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        key: ValueKey(isFavorite),
                                        color: isFavorite ? Colors.red : null,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
