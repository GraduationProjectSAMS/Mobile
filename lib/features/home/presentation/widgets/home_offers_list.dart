import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/functions/staggered_animations.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeOffersList extends StatelessWidget {
  const HomeOffersList(
      {super.key, required this.offersList, this.isLoading = false});

  final List<ProductEntity> offersList;
  final bool isLoading;

  List<ProductEntity> get offers => isLoading ? productsWaiting : offersList;

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
              index: index,
              isHorizontal: true,
              child: ProductItem(
                width: 20.hR,
                model: offers[index],
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(
              width: 5,
            ),
            itemCount: offers.length,
          ),
        ),
      ),
    );
  }
}
