import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/icon_broken.dart';
import 'package:graduation_project/features/home/presentation/screens/home_screen.dart';
import 'package:graduation_project/features/home/presentation/screens/products_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/profile_screen.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../screens/offers_screen.dart';

class HomeMobileBodyLayout extends StatefulWidget {
  const HomeMobileBodyLayout({super.key});

  @override
  State<HomeMobileBodyLayout> createState() => _HomeMobileBodyLayoutState();
}

class _HomeMobileBodyLayoutState extends State<HomeMobileBodyLayout> {
  int _selectedIndex = 0;
  final icons = [
    IconBroken.Home,
    IconBroken.Bag,
    IconBroken.Discount,
    IconBroken.Profile,
  ];
  final titles = [
    AppStrings.home,
    AppStrings.products,
    AppStrings.offers,
    AppStrings.profile,
  ];
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProductsScreen(),
    const OffersScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _screens[_selectedIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: List.generate(
          icons.length,
          (index) => NavigationDestination(
            icon: Icon(icons[index], size: 28),
            selectedIcon: Icon(
              icons[index],
              size: 30,
              color: AppColors.primary,
            ),
            label: titles[index],
          ),
        ),
        // destinations: const [
        //   NavigationDestination(
        //     icon: Icon(IconBroken.Home, size: 28),
        //     selectedIcon: Icon(IconBroken.Home,  size: 30,color: AppColors.primaryColor,),
        //     label: 'Home',
        //   ),
        //   NavigationDestination(
        //     icon: Icon(IconBroken.Bag, size: 28),
        //     selectedIcon: Icon(IconBroken.Bag,  size: 30,color: AppColors.primaryColor,),
        //     label: 'products',
        //   ),
        //   NavigationDestination(
        //     icon: Icon(IconBroken.Discount, size: 28),
        //     selectedIcon: Icon(IconBroken.Discount,  size: 30,color: AppColors.primaryColor),
        //     label: 'Cart',
        //   ),
        //   NavigationDestination(
        //     icon: Icon(IconBroken.Profile, size: 28,),
        //     selectedIcon: Icon(IconBroken.Profile, size: 30,color: AppColors.primaryColor),
        //     label: 'Profile',
        //   ),
        // ],
      ),
    );
  }
}
