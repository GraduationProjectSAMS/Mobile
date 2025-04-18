import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_bloc_builder.dart';

import '../../../../core/widgets/custom_search_bar.dart';
import 'filter_chip_list_screen.dart';

class ProductsScreenBody extends StatelessWidget {
  const ProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            children: [
              Text(
                AppStrings.products,
                style: AppStyles.textStyle20,
              ),
              SizedBox(
                height: 10,
              ),
              CustomSearchBar(
                hintText: 'Search for products',
              ),
            ],
          ),
        ),
        FilterChipListScreen(),
        SizedBox(
          height: 10,
        ),
        Expanded(child: ProductBlocBuilder()),
      ],
    );
  }
}
