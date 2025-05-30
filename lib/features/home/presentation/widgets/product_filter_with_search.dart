import 'package:flutter/material.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import 'filter_product_button_sheet_design.dart';

class ProductFilterWithSearch extends StatelessWidget {
  const ProductFilterWithSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.products,
                style: AppStyles.textStyle20,
              ),
              IconButton(
                  onPressed: () {
                    showFilterProductButtonSheet(
                      context: context,
                    );
                  },
                  icon: const Icon(Icons.filter_list_outlined,
                      size: 30, color: Colors.black54)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomSearchBar(

            hintText: 'Search for products',
          ),
        ],
      ),
    );
  }
}
