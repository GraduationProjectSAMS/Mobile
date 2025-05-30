import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_bloc_builder.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_filter_with_search.dart';


class ProductsScreenBody extends StatelessWidget {
  const ProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProductFilterWithSearch(),

        Expanded(child: ProductBlocBuilder()),
      ],
    );
  }
}
