import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/functions/list_methods.dart';
import 'package:graduation_project/core/widgets/app_api_error_widget.dart';
import 'package:graduation_project/features/cards/presentation/manager/add_to_card_cubit/add_to_card_cubit.dart';
import 'package:graduation_project/features/cards/presentation/widgets/card_list.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

import 'empty_cart_item.dart';

class CardBlocBuilder extends StatelessWidget {
  const CardBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCardCubit, AddToCardStates>(
      builder: (context, state) {
        final addToCardCubit = context.read<AddToCardCubit>();
        if (state is GetCardError) {
          return AppApiErrorWidget(errorMessage: state.errorMessage);
        } else {
          return buildListOrEmptyItem<ProductEntity>(
              list: addToCardCubit.selectedCards.values.toList(),
              isLoading: false,
              listEmptyWidget: EmptyCartItem.new,
              listWidget: (List<ProductEntity> list, bool isLoading) =>
                  CardList(productsList: list, isLoading: false));
        }
      },
    );
  }
}
