import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';
import '../../domain/entities/product_entity.dart';

class NewlyAddedList extends StatelessWidget {
  const NewlyAddedList(
      {super.key, required this.productsList, this.isLoading = false});

  final bool isLoading;

  final List<ProductEntity> productsList;

  List<ProductEntity> get products {
    return isLoading ? productsWaiting : productsList;
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: AnimationLimiter(
        child: SizedBox(
          height: 28.hR,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => ListItemAnimation(
              isHorizontal: true,
              index: index,
              child: ProductItem(
                height: 29.hR,
                width: 20.hR,
                entity: products[index],
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(
              width: 5,
            ),
            itemCount: products.length,
          ),
        ),
      ),
    );
  }
}
