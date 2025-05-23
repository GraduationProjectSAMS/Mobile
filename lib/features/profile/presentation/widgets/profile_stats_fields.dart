import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/config/routes/app_route.dart';
import '../../../../core/utilities/resources/app_strings.dart';
import '../../../favorites/presentation/manager/add_favorite_cubit/add_favorite_cubit.dart';

class ProfileStatsFields extends StatelessWidget {
  const ProfileStatsFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileStatItem(
          onTap: () {
            context.navigateTo(
                pageName: AppRoutes.favorites, arguments: (context: context));
          },
          icon: Icons.favorite_border,
          color: Colors.red,
          backgroundColor: Colors.red.withValues(alpha: 0.3),
          label: AppStrings.favorites,
          value: context.read<AddFavoriteCubit>().favoritesCount.toString(),
        ),
        ProfileStatItem(
          onTap: () {
            context.navigateTo(
              pageName: AppRoutes.orders,
            );
          },
          iconAsset: 'assets/images/purchase-order.png',
          color: Colors.green,
          backgroundColor: Colors.green.withValues(alpha: 0.3),
          label: 'My Orders',
        ),
      ],
    );
  }
}

class ProfileStatItem extends StatelessWidget {
  final IconData? icon;
  final String? iconAsset;
  final Color color;
  final Color backgroundColor;
  final String label;
  final String? value;
  final VoidCallback? onTap;

  const ProfileStatItem({
    super.key,
    this.icon,
    this.iconAsset,
    required this.color,
    required this.backgroundColor,
    required this.label,
    this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            icon != null
                ? Icon(icon, color: color, size: 25.sp)
                : ImageIcon(AssetImage(iconAsset!), color: color, size: 25.sp),
            const SizedBox(width: 3),
            Text(label,
                style: TextStyle(fontSize: 14.sp, color: Colors.black54)),
            if (value != null) ...[
              const SizedBox(width: 10),
              Container(width: 1, height: 20, color: Colors.black54),
              const SizedBox(width: 5),
              Text(value!,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600)),
            ]
          ],
        ),
      ),
    );
  }
}
