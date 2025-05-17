import 'package:flutter/material.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_actions.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_details_image_with_app_bar.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_rating.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_size_with_description.dart';

import 'buy_and_action_buttons.dart';
import 'product_title_and_price.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  ProductDetailsImageWithAppBar(),
                  SizedBox(height: 20),
                  ProductTitleAndPrice(),
                  ProductRating(),
                  ProductSizeWithDescription(),
                  ProductActions(),
                  Spacer(),
                  BuyAndActionButtons(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
