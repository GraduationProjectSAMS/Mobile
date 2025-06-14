import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_item.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';
import '../../domain/entities/product_entity.dart';

class ProductRecommendationsList extends StatelessWidget {
  const ProductRecommendationsList({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SizedBox(
        height: 250.sp,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => ListItemAnimation(
            isHorizontal: true,
            index: index,
            child: ProductItem.recommendations(
              width: 180.sp,

              entity: products[index],
            ),
          ),
          separatorBuilder: (_, __) => const SizedBox(
            width: 5,
          ),
          itemCount: products.length,
        ),
      ),
    );
  }
}
