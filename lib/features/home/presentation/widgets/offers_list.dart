import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';
import '../../domain/entities/product_entity.dart';

class OffersList extends StatelessWidget {
  const OffersList(
      {super.key, required this.productsList, this.isLoading = false,  this.enableHeroTag=true,  this.isAdmin=false,});

  final List<ProductEntity> productsList;
  final bool isLoading;
  final bool enableHeroTag;
  final bool isAdmin ;
  List<ProductEntity> get products {
    return isLoading ? productsWaiting : productsList;
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: AnimationLimiter(
        child: GridView.builder(
          itemCount: products.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.gridCount,
            mainAxisExtent: 30.hR,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int index) => GideItemAnimation(
              index: index,
              columnCount: context.gridCount,
              child: ProductItem(
                entity: products[index],
              )),
        ),
      ),
    );
  }
}
