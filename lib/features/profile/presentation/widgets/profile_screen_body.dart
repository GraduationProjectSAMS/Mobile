import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/widgets/my_cached_network_image.dart';

import '../../../../core/utilities/services/cache_service.dart';
import 'change_password_dialog.dart';
import 'change_username_dialog.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(right: 20.0, left: 20.0, bottom: 15.0, top: 9.hR),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyCachedNetworkImage(
                isOval: true,
                height: 120.sp,
                width: 120.sp,
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/social-vape.appspot.com/o/r2eN3MVrYKZBLkIUq9529uAjHLm2%2FuserProfilePhoto%2Fimage_cropper_1692455002427.jpg?alt=media&token=8e2e1db9-de01-42ff-8e60-39e0d0a9abae',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Shady Hisham',
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'shady.hesham@gmail.com',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 25.sp,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Favorites',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '12',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        ImageIcon(
                          const AssetImage('assets/images/purchase-order.png'),
                          color: Colors.green,
                          size: 25.sp,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Past Orders',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '12',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // make a white container to and put in it a list of menu items
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
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
                      (index) => buildMenuItem(
                        icon: menuIcons[index],
                        title: menuItems[index],
                        color: menuColors[index],
                        onTap: () async {
                          if (index == 0) {
                            changeUserNameDialog(context);
                          } else if (index == 1) {
                            showChangePasswordDialog(context);
                          } else if (index == 2) {
                            await CacheService.removeData(
                                key: AppConstants.token);
                            if (!context.mounted) return;
                            context.navigateAndRemoveUntil(
                                pageName: AppRoutes.login);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required IconData icon,
      required String title,
      required Color color,
      required Function onTap}) {
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
        onTap: () => onTap(),
      ),
    );
  }
}
