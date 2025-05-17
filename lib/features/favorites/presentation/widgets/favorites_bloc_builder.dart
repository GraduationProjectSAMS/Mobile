import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/functions/list_methods.dart';
import 'package:graduation_project/core/widgets/app_api_error_widget.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_list.dart';

import '../manager/add_favorite_cubit/add_favorite_cubit.dart';
import 'empty_favorites_widget.dart';

class FavoritesBlocBuilder extends StatelessWidget {
  const FavoritesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFavoriteCubit, AddFavoriteStates>(
      builder: (context, state) {
        final cubit = context.read<AddFavoriteCubit>();

        if (state is GetFavoritesErrorState) {
          return AppApiErrorWidget(errorMessage: state.errorMessage);
        }
        return buildListOrEmptyItem<ProductEntity>(
          list: cubit.selectedProducts.values.toList(),
          isLoading: false,
          listEmptyWidget: EmptyFavoritesWidget.new,
          listWidget: (List<ProductEntity> list, bool isLoading) =>
              ProductList(isLoading: isLoading, productsList: list,enableHeroTag: false,),
        );
      },
    );
  }
}
