import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';
import 'order_details_product_item.dart';

class OrderDetailsProductList extends StatelessWidget {
  const OrderDetailsProductList({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        // compute how many columns fit
        final gridCount = constraints.crossAxisExtent.gridCount;

        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => GideItemAnimation(
              index: index,
              columnCount: gridCount,
              child: OrderDetailsProductItem(
                entity: products[index],
              ),
            ),
            childCount: products.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridCount,
            mainAxisExtent: 240.sp,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
        );
      },
    );
  }
}
