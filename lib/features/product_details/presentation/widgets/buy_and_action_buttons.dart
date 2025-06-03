import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_actions.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/services/size_config_service.dart';
import '../../../favorites/presentation/manager/add_favorite_cubit/add_favorite_cubit.dart';

class BuyAndActionButtons extends StatelessWidget {
  const BuyAndActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    if (SizeConfigService.isDesktop) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: AppColors.primary

        ),
      ),
      child: Row(

        children: [
          const CardActionButton(),
          const SizedBox(width: 10),
          const FavoriteActionIcon(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class FavoriteActionIcon extends StatelessWidget {
  const FavoriteActionIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFavoriteCubit, AddFavoriteStates>(
      builder: (context, state) {
        final cubit = context.read<AddFavoriteCubit>();
        final entity = context.productDetailsArgs.entity;
        final isFavorite =
            cubit.productsKeys['${entity.id}${entity.type}'] ?? false;

        return InkWell(
          onTap: () => cubit.toggleFavoriteBackEnd(entity),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ]),
            width: 36.sp,
            height: 36.sp,
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey(isFavorite),
                  color: isFavorite ? Colors.red : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
