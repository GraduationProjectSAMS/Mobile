import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/presentation/screens/home_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/profile_screen.dart';

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

  final List<Widget> _screens = [
    HomeScreen(),
    FavoritesScreen(),
    AddToCardScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index== _selectedIndex ) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _screens[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


