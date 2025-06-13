import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/presentation/manager/product_recommendations_cubit/product_recommendations_cubit.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_recommendations_list.dart';

import '../../../../core/utilities/resources/app_styles.dart';

class ProductRecommendationsBlocBuilder extends StatelessWidget {
  const ProductRecommendationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductRecommendationsCubit,
        ProductRecommendationsState>(
      builder: (context, state) {
        switch (state) {
          case ProductRecommendationsSuccess():
            if (state.recommendations.isEmpty) {
              return const SizedBox.shrink();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Recommended For You',
                      style: AppStyles.textStyle18.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const SizedBox(height: 10),
                ProductRecommendationsList(products: state.recommendations),
              ],
            );
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
