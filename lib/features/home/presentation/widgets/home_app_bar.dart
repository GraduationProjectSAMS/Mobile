import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/resources/app_assets.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/icon_broken.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../cards/presentation/manager/add_to_card_cubit/add_to_card_cubit.dart';
import '../../../favorites/presentation/manager/add_favorite_cubit/add_favorite_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  static const icons = [
    IconBroken.Notification,
    IconBroken.Heart,
    IconBroken.Buy
  ];
  static const titles = [
    AppStrings.notification,
    AppStrings.favorites,
    AppStrings.myCart,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.appLogo,
          height: 50.sp,
          width: 50.sp,
        ),
        const Spacer(),
        ...List.generate(
            icons.length, (index) {
          if (index == 1) {
            return BlocBuilder<AddFavoriteCubit, AddFavoriteStates>(
              builder: (context, state) {
                final cubit = BlocProvider.of<AddFavoriteCubit>(context);
                return AppBarIconItem(
                  icon: icons[index],
                  onPressed: () {
                    context.navigateTo(
                        pageName: AppRoutes.favorites,
                        arguments: (context: context));
                  },
                  tooltip: titles[index],
                  count: cubit.favoritesCount,
                );
              },
            );

          }
          if (index == 2) {
            return BlocBuilder<AddToCardCubit, AddToCardStates>(
              builder: (context, state) {
                final cubit = BlocProvider.of<AddToCardCubit>(context);
                return AppBarIconItem(
                  icon: icons[index],
                  onPressed: () {

             context.navigateTo(pageName: AppRoutes.cart,arguments: (context: context));
                  },
                  tooltip: titles[index],
                  count: cubit.cardsCount,
                );
              },
            );
          }
          return AppBarIconItem(
            icon: icons[index],
            onPressed: () {},
            tooltip: titles[index],
          );
        })
      ],
    );
  }
}

class AppBarIconItem extends StatelessWidget {
  const AppBarIconItem(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.tooltip,
      this.count = 0});

  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;

  final int count;

  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: count > 0,
      alignment: AlignmentDirectional.topStart,
      label: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(0, -2), // Start below
            end: Offset.zero, // Slide to original position
          ).animate(animation);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        child: FittedBox(
          key: ValueKey<int>(count),
          // Very important for triggering the animation
          fit: BoxFit.scaleDown,
          child: Text(
            '$count',
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: IconButton(
          tooltip: tooltip,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.offPrimary),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
            ),
          ),
          icon: Icon(
            icon,
            size: 28.sp,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
