import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.productsList,
    this.isLoading = false,
    this.enableHeroTag = true,
    this.isAdmin = false,
  });

  final List<ProductEntity> productsList;
  final bool isLoading;
  final bool enableHeroTag;
  final bool isAdmin;

  List<ProductEntity> get products {
    return isLoading ? productsWaiting : productsList;
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: LayoutBuilder(builder: (context, constraints) {
        final gridCount = constraints.maxWidth.gridCount;
        return AnimationLimiter(
          child: GridView.builder(
            cacheExtent: 500.hR,
            // Increased for better preloading
            addAutomaticKeepAlives: false,
            // Disable keep alive for memory efficiency// Enable repaint boundaries
            addSemanticIndexes: false,
            // Disable if not needed for accessibility
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
              mainAxisExtent: 250.sp,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (BuildContext context, int index) => GideItemAnimation(
                index: index,
                columnCount: gridCount,
                child: ProductItem(
                  enableHeroTag: enableHeroTag,
                  isAdmin: isAdmin,
                  entity: products[index],
                )),
          ),
        );
      }),
    );
  }
}
