import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/functions/my_toast.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/my_cached_network_image.dart';
import 'package:graduation_project/features/cards/presentation/manager/add_to_card_cubit/add_to_card_cubit.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/routes/app_route.dart';
import '../../../favorites/presentation/manager/add_favorite_cubit/add_favorite_cubit.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity entity;
  final double? width;
  final double? height;
  final bool enableHeroTag;
  final bool isAdmin;
  final bool isOffer;
  final bool _isRecommendations;

  const ProductItem({
    super.key,
    this.width,
    this.height,
    required this.entity,
    this.isAdmin = false,
    this.enableHeroTag = true,
    this.isOffer = false,
  }) : _isRecommendations = false;

  const ProductItem.recommendations({
    super.key,
    this.width,
    this.height,
    required this.entity,
    this.isAdmin = false,
    this.enableHeroTag = true,
    this.isOffer = false,
  }) : _isRecommendations = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.navigateTo(
              pageName: AppRoutes.productDetails,
              arguments: (entity: entity, context: context));
        },
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      if (enableHeroTag)
                        Hero(
                          tag: '${entity.imageUrl}${entity.id}${entity.type}',
                          child: MyCachedNetworkImage(
                              fit: BoxFit.fill, imageUrl: entity.imageUrl),
                        )
                      else
                        MyCachedNetworkImage(
                            fit: BoxFit.fill, imageUrl: entity.imageUrl),
                      if (!isAdmin)
                        Positioned(
                          top: 5,
                          right: 5,
                          child: Skeleton.ignore(
                            child: BlocBuilder<AddFavoriteCubit,
                                AddFavoriteStates>(
                              builder: (context, state) {
                                final cubit = context.read<AddFavoriteCubit>();
                                final isFavorite = cubit.productsKeys[
                                        '${entity.id}${entity.type}'] ??
                                    false;

                                return InkWell(
                                  onTap: () =>
                                      cubit.toggleFavoriteBackEnd(entity),
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
                        maxLines: _isRecommendations ? 1 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle12
                            .copyWith(color: AppColors.grey),
                      ),
                    if (_isRecommendations) ...[
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Compatibility: ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            '${entity.compatibilityPercentage}%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _getCompatibilityColor(
                                  entity.compatibilityPercentage.toInt()),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                        if (!isAdmin)
                          Skeleton.shade(
                            child: BlocBuilder<AddToCardCubit, AddToCardStates>(
                              builder: (context, state) {
                                final cubit = context.read<AddToCardCubit>();
                                final key = '${entity.id}${entity.type}';
                                final isInCard =
                                    cubit.productsCards.containsKey(key);

                                return InkWell(
                                  onTap: () {
                                    if (entity.maxQuantity == 0) {
                                      myToast(
                                          msg: 'product not available ',
                                          state: ToastStates.normal);
                                    } else {
                                      cubit.updateCart(model: entity);
                                    }
                                  },
                                  child: Container(
                                    height: 32.sp,
                                    width: 32.sp,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      transitionBuilder: (child, animation) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                        );
                                      },
                                      child: isInCard
                                          ? FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                  maxLines: 1,
                                                  cubit.productsCards[key]
                                                      .toString(),
                                                  key: ValueKey(
                                                      'count_${cubit.productsCards[key]}'),
                                                  // important!
                                                  style: AppStyles.textStyle18
                                                      .copyWith(
                                                          color:
                                                              AppColors.white)),
                                            )
                                          : const Icon(
                                              Icons.add,
                                              color: AppColors.white,
                                              key: ValueKey(
                                                  'add_icon'), // important!
                                            ),
                                    ),
                                  ),
                                );
                              },
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

  Color _getCompatibilityColor(int compatibility) {
    if (compatibility >= 90) return Colors.green.shade600;
    if (compatibility >= 80) return Colors.orange.shade600;
    return Colors.red.shade600;
  }
}
