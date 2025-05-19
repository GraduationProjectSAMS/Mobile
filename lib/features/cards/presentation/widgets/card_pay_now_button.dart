import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/features/orders/data/models/order_products.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../../../../core/widgets/my_button_widget.dart';
import '../manager/add_to_card_cubit/add_to_card_cubit.dart';

class CardPayNowButton extends StatelessWidget {
  const CardPayNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCardCubit, AddToCardStates>(
      builder: (context, state) {
        final addToCardCubit = context.read<AddToCardCubit>();

        if (addToCardCubit.productsCards.isNotEmpty) {
          return Skeletonizer(
            enabled: state is AddToCardLoading,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex:
                        addToCardCubit.totalPrice.toString().length > 8 ? 2 : 1,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        maxLines: 1,
                        'Total Price: ${addToCardCubit.totalPrice}',
                        style: AppStyles.textStyle18
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: MyButton(
                          onPressed: () => onTapPayNow(addToCardCubit, context),
                          text: AppStrings.payNow)),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void onTapPayNow(AddToCardCubit addToCardCubit, BuildContext context) {
    final orderProducts =
        addToCardCubit.selectedCards.values.toList().toOrderProductList;
    final orderProductsWithQuantity = orderProducts.map((orderProduct) {
      final quantity = addToCardCubit
          .productsCards['${orderProduct.id}${orderProduct.type}'];
      return orderProduct.copyWith(quantity: quantity);
    }).toList();
    context.navigateTo(
      pageName: AppRoutes.payment,
      arguments: (
        totalPrice: addToCardCubit.totalPrice,
        orderProducts: orderProductsWithQuantity,
      ),
    );
  }
}
