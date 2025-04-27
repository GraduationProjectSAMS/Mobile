import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/cards/presentation/manager/add_to_card_cubit/add_to_card_cubit.dart';

import '../../../../core/config/routes/app_route.dart';
import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../../../../core/widgets/my_cached_network_image.dart';
import '../../../home/domain/entities/product_entity.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.model, this.width, this.height});

  final ProductEntity model;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.offPrimary,
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        context.navigateTo(pageName: AppRoutes.productDetails);
      },
      child: Card(
        elevation: 3,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      MyCachedNetworkImage(
                          fit: BoxFit.fill, imageUrl: model.imageUrl),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      model.name,
                      style: AppStyles.textStyle15
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (model.description.isNotEmpty)
                      Text(
                        model.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle12
                            .copyWith(color: AppColors.grey),
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            alignment: AlignmentDirectional.topStart,
                            fit: BoxFit.scaleDown,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'EGP ',
                                    style: AppStyles
                                        .textStyle14, // Smaller font for EGP
                                  ),
                                  TextSpan(
                                    text: '${model.price}',
                                    style: AppStyles.textStyle18.copyWith(
                                        fontWeight: FontWeight
                                            .w600), // Original font for price
                                  ),
                                ],
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                      EdgeInsets.zero), // Make it smaller
                                  minimumSize: WidgetStateProperty.all(
                                      const Size(30, 30)),
                                  backgroundColor:
                                      WidgetStateProperty.all(AppColors.white),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed: () =>context.read<AddToCardCubit>().updateCart(model: model,isAdd: false),
                                icon: const Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                              ),
                              BlocBuilder<AddToCardCubit, AddToCardStates>(
                                builder: (context, state) {
                                  final cubit = context.read<AddToCardCubit>();
                                  final key = '${model.id}${model.type}';

                                  return Text(
                                    maxLines: 1,
                                    cubit.productsCards[key].toString(),

                                    // important!
                                    style: AppStyles.textStyle18,
                                  );
                                },
                              ),
                              IconButton(
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                      EdgeInsets.zero), // Make it smaller
                                  minimumSize: WidgetStateProperty.all(
                                      const Size(30, 30)),
                                  backgroundColor:
                                      WidgetStateProperty.all(AppColors.white),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed: () =>context.read<AddToCardCubit>().updateCart(model: model),
                                icon: const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () => context
                                .read<AddToCardCubit>()
                                .deleteCard(model),
                            icon: Icon(
                              Icons.delete_forever,
                              color: AppColors.red,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
