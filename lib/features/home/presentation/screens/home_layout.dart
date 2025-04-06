import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/icon_broken.dart';
import 'package:graduation_project/features/home/presentation/screens/home_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/profile_screen.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import 'add_to_card_screen.dart';
import 'favorites_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    /// why i make this because i will make all
    return HomeLayoutBody();
  }
}

class HomeLayoutBody extends StatefulWidget {
  const HomeLayoutBody({super.key});

  @override
  State<HomeLayoutBody> createState() => _HomeLayoutBodyState();
}

class _HomeLayoutBodyState extends State<HomeLayoutBody> {
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
    HomeScreen(),
    FavoritesScreen(),
    AddToCardScreen(),
    ProfileScreen(),
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
          duration: Duration(milliseconds: 300),
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
