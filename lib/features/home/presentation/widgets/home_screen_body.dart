import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';

import 'banner_list_with_indicator.dart';
import 'home_offers_bloc_builder.dart';
import 'home_product_bloc_builder.dart';
import 'home_text_title.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerListWithIndicator(),
                HomeTextTitle(
                  title: AppStrings.newlyAdded,
                ),
                HomeProductBlocBuilder(),
                HomeTextTitle(
                  title: AppStrings.offers,
                ),
                HomeOffersBlocBuilder(),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
