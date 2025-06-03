import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';
import 'package:graduation_project/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_counter_widget.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../cards/presentation/manager/add_to_card_cubit/add_to_card_cubit.dart';
import 'buy_and_action_buttons.dart';
import 'product_color_selector.dart';

class ProductActions extends StatelessWidget {
  const ProductActions({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = context.productDetailsArgs;
    if (SizeConfigService.isDesktop) {
      return const SizedBox();
    }
    return Row(

      children: [
        if(arg.entity.type != AppConstants.offers)
          ProductColorSelector(
            availableColors: const [
              Color(0xFFC2C0C0),
              Color(0xFF6B4F3B),
              Color(0xFF3A3A3A),
            ],
            initialColor: const Color(0xFFC2C0C0),
            onColorSelected: (color) {},
          ),

        Spacer(),
        ...[ const CardActionButton(),
          SizedBox(width: 6,),
          const FavoriteActionIcon(),
        ]

      ],
    );
  }
}

class CardActionButton extends StatelessWidget {
  const CardActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCardCubit, AddToCardStates>(
      builder: (context, state) {
        final entity = context.productDetailsArgs.entity;
        final cubit = context.read<AddToCardCubit>();
        final key = '${entity.id}${entity.type}';
        final isInCard = cubit.productsCards.containsKey(key);

        return AnimatedCrossFade(
          alignment: Alignment.center,
          firstChild: _buildAddButton(context, cubit, entity),
          secondChild: _buildProductCounter(context, cubit, entity, key),
          crossFadeState:
          isInCard ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
          firstCurve: Curves.easeInOut,
          secondCurve: Curves.easeInOut,
          sizeCurve: Curves.easeInOut,
        );
      },
    );
  }

  Widget _buildProductCounter(BuildContext context, AddToCardCubit cubit,
      dynamic entity, String key) {
    return ProductCounter(
      key: ValueKey('counter_${cubit.productsCards[key]}'),
      title: '${cubit.productsCards[key]}',
      onAdd: () => cubit.updateCart(model: entity),
      onRemove: () => cubit.updateCart(model: entity, isAdd: false),
    );
  }

  Widget _buildAddButton(BuildContext context, AddToCardCubit cubit,
      dynamic entity) {
    return Card(
      shape: const CircleBorder(),
      elevation: 4,
      shadowColor: AppColors.black,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => cubit.updateCart(model: entity),
          customBorder: const CircleBorder(), // important to match shape
          child: const Icon(
            Icons.add_shopping_cart,
            size: 20, // optional: make size balanced inside
          ),
        ),
      ),
    );
  }
}
