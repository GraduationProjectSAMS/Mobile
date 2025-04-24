import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/custom_search_bar.dart';
import 'package:graduation_project/core/widgets/height_sized_box.dart';

import 'offers_bloc_builder.dart';

class OffersScreenBody extends StatelessWidget {
  const OffersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.offers,
                style: AppStyles.textStyle20,
              ),
              const HeightSizedBox(height: 1),
              const CustomSearchBar(),
            ],
          ),
        ),
        const HeightSizedBox(height: 1),
        const Expanded(child: OffersBlocBuilder())
      ],
    );
  }
}
