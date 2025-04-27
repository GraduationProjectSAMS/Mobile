import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/cards/presentation/widgets/card_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';
import '../../../home/domain/entities/product_entity.dart';

class CardList extends StatelessWidget {
  const CardList(
      {super.key, required this.productsList, required this.isLoading});

  final List<ProductEntity> productsList;
  final bool isLoading;

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
            mainAxisExtent: 300.sp,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int index) => GideItemAnimation(
              index: index,
              columnCount: context.gridCount,
              child: CardItem(
                model: products[index],
              )),
        ),
      ),
    );
  }
}
