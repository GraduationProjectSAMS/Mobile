import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/presentation/manager/products_cubit/product_cubit.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_list.dart';

import '../../../../core/widgets/app_api_error_widget.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key,  this.isAdmin=false});
final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        final productCubit = BlocProvider.of<ProductCubit>(context);
        if (state is ProductErrorStates) {
          return AppApiErrorWidget(errorMessage: state.errorMessage);
        }
        return ProductList(
          isAdmin: isAdmin,
          productsList: productCubit.products,
          isLoading: state is ProductLoadingStates,
        );
      },
    );
  }
}
