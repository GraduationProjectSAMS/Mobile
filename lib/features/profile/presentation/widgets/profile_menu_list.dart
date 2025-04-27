import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/config/routes/app_route.dart';
import '../../../../core/utilities/resources/app_constants.dart';
import '../../../../core/utilities/services/cache_service.dart';
import 'change_password_dialog.dart';
import 'change_username_dialog.dart';

class ProfileMenuList extends StatelessWidget {
  static List<String> menuItems = [
    'Change Username',
    'Change Password',
    'Logout',
  ];
  static List<IconData> menuIcons = [
    Icons.person,
    Icons.lock,
    Icons.logout,
  ];
  static List<Color> menuColors = [
    Colors.black,
    Colors.black,
    Colors.red,
  ];

  const ProfileMenuList({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ...List.generate(
            menuItems.length,
                (index) => ProfileMenuItem(
              icon: menuIcons[index],
              title: menuItems[index],
              color: menuColors[index],
              onTap: () async {
                if (index == 0) {
                  changeUserNameDialog(context);
                } else if (index == 1) {
                  showChangePasswordDialog(context);
                } else if (index == 2) {
                  await CacheService.removeData(key: AppConstants.token);
                  if (!context.mounted) return;
                  context.navigateAndRemoveUntil(pageName: AppRoutes.login);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: Icon(
          icon,
          size: 22.sp,
          color: color,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
