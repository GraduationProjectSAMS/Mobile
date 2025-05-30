import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/features/home/presentation/manager/offers_cubit/offers_cubit.dart';
import 'package:graduation_project/features/home/presentation/manager/products_cubit/product_cubit.dart';

import 'banner_list_with_indicator.dart';
import 'home_offers_bloc_builder.dart';
import 'home_product_bloc_builder.dart';
import 'home_text_title.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BannerListWithIndicator(),
          HomeTextTitle(
            title: AppStrings.newlyAdded,
            onTap: context.read<ProductCubit>().viewAllProducts,
          ),
          const HomeProductBlocBuilder(),
          HomeTextTitle(
            title: AppStrings.offers,
            onTap: context.read<OffersCubit>().viewAllOffers,
          ),
          const HomeOffersBlocBuilder(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
