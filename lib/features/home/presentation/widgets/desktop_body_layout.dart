import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_bloc_builder.dart';

class DesktopBodyLayout extends StatelessWidget {
  const DesktopBodyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primary),
              child: Text(
                'Admin Dashboard',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout,color: Colors.red,),
              title: const Text('Logout',style: TextStyle(color: Colors.red),),
              onTap: () {
                context.navigateTo(pageName: AppRoutes.login);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 32.sp,
                      ));
                }),
                const Text(
                  'All Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: AppColors.primary,
                    size: 32.sp,
                  ),
                  onPressed: () {
                    context.navigateTo(pageName: AppRoutes.addProduct);
                  },
                ),
              ],
            ),
          ),
          const Expanded(
            child: ProductBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
