import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/widgets/add_button.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_bloc_builder.dart';

import '../../../../core/config/routes/app_route.dart';
import '../manager/products_cubit/product_cubit.dart';

class ProductsDesktopScreen extends StatelessWidget {
  const ProductsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AddButton(
                  text: AppStrings.addProduct,
                  onPressed: () {
                    context.navigateTo(pageName: AppRoutes.addProduct).then(
                      (value) {
                        if (value == true) {
                          final productCubit =
                              BlocProvider.of<ProductCubit>(context);
                          productCubit.products.clear();
                          productCubit.homeProducts.clear();
                          productCubit.getProducts();
                        }
                      },
                    );
                  })
            ],
          ),
        ),
        const Expanded(
          child: ProductBlocBuilder(
            isAdmin: true,
          ),
        ),
      ],
    );
  }
}
