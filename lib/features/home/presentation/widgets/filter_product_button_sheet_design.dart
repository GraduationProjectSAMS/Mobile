import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

import 'filter_chip_list_screen.dart';

void showFilterProductButtonSheet({
  required BuildContext context,
}) {
  showModalBottomSheet(
    backgroundColor: AppColors.offWhite,
    context: context,
    builder: (_) => const FilterProductButtonSheetDesign(),
  );
}

class FilterProductButtonSheetDesign extends StatelessWidget {
  const FilterProductButtonSheetDesign({super.key, this.initialSelected});

  final String? initialSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Categories',
                style: AppStyles.textStyle20,
              ),
              const SizedBox(
                height: 10,
              ),
              FilterChipList(
                filters: const [
                  'Dining Sets',
                  'Chairs',
                  'Tables',
                  'Beds',
                  'Outdoor Furniture',
                  'Desks',
                  'Cabinets',
                  'Office Furniture',
                  'Kids\' Furniture',
                  'Accent Furniture',
                  'TV Stands & Media Units',
                  'Shelves & Bookcases',
                  'Dressers & Drawers',
                  'Wardrobes & Closets',
                  'Sofas & Couches',
                ],
                initialSelected: 'Office',
                onSelectionChanged: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
