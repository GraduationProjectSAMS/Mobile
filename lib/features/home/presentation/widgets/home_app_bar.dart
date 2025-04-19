import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_assets.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/icon_broken.dart';

import '../../../../core/utilities/resources/app_strings.dart';

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
            icons.length,
            (index) => AppBarIconItem(
                  icon: icons[index],
                  onPressed: () {},
                  tooltip: titles[index],
                ))
      ],
    );
  }
}

class AppBarIconItem extends StatelessWidget {
  const AppBarIconItem(
      {super.key, required this.icon, required this.onPressed, this.tooltip});

  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
