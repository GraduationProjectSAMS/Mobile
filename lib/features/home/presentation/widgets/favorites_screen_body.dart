import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/utilities/resources/icon_broken.dart';

import 'ddd.dart';
import 'product_list.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({super.key});

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
                'Products',
                style: AppStyles.textStyle20,
              ),
              SizedBox(
                height: 10,
              ),
              SearchBar(
                backgroundColor: WidgetStateProperty.all(AppColors.white),
                surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
                hintText: 'Search for products',
                trailing: [
                  Icon(Icons.close),
                ],
                leading: Icon(IconBroken.Search),
                constraints: BoxConstraints(
                  minHeight: 50,
                ),
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
            ],
          ),
        ),
        FilterChipListScreen(),
        SizedBox(
          height: 10,
        ),
        Expanded(child: ProductList()),
      ],
    );
  }
}
