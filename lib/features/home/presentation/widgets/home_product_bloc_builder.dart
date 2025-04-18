import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/app_api_error_widget.dart';
import 'package:graduation_project/features/home/presentation/manager/products_cubit/product_cubit.dart';

import 'newly_added_list.dart';

class HomeProductBlocBuilder extends StatelessWidget {
  const HomeProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        final productCubit = BlocProvider.of<ProductCubit>(context);
        if (state is ProductErrorStates) {
          return AppApiErrorWidget(errorMessage: state.errorMessage);
        }
        return NewlyAddedList(
          productsList: productCubit.homeProducts,
          isLoading: state is ProductLoadingStates,
        );
      },
    );
  }
}
