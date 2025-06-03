import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';
import 'package:graduation_project/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_rating.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_title_and_price.dart';

import '../../../../core/widgets/my_cached_network_image.dart';
import 'buy_and_action_buttons.dart';
import 'product_actions.dart';
import 'product_size_with_description.dart';

class ProductDetailsScreenBodyDesktop extends StatelessWidget {
  const ProductDetailsScreenBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: MyBackButton(),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DiskTopProductDetailsImage(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            child: Column(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                      height: 20,
                                    )),
                                ProductTitleAndPrice(),
                                ProductRating(),
                                ProductSizeWithDescription(),
                                ProductActions(),
                                SizedBox(height: 20),
                                Expanded(
                                    child: SizedBox(
                                      height: 20,
                                    )),

                                SizedBox(height: 20),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiskTopProductDetailsImage extends StatelessWidget {
  const DiskTopProductDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = context.productDetailsArgs;
    return Column(
      children: [
        const Expanded(
          child: SizedBox(
            height: 20,
          ),
        ),
        Expanded(
          flex: 4,
          child: Hero(
            tag: '${arg.entity.imageUrl}${arg.entity.id}${arg.entity.type}',
            child: MyCachedNetworkImage(
                height: 60.hR, fit: BoxFit.fill, imageUrl: arg.entity.imageUrl),
          ),
        ),
        const Expanded(
          child: SizedBox(
            height: 20,
          ),
        ),
      ],
    );
  }
}
