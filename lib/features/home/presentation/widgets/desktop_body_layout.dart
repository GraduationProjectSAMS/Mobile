import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/services/dependency_injection_service.dart';
import '../../../profile/presentation/manager/logout_cubit/logout_cubit.dart';
import '../screens/offers_desktop_screen.dart';
import '../screens/orders_desktop_screen.dart';
import '../screens/products_desktop_screen.dart';
import 'furniture_drawer.dart';

class DesktopBodyLayout extends StatefulWidget {
  const DesktopBodyLayout({super.key});

  @override
  DesktopBodyLayoutState createState() => DesktopBodyLayoutState();
}

class DesktopBodyLayoutState extends State<DesktopBodyLayout> {
  // manages which screen is visible
  final _selectedIndex = ValueNotifier<int>(0);

  // your list of screens
  final _screens = [
    Text(
      'Dashboard',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    ProductsDesktopScreen(),
    const OffersDesktopScreen(),
    const OrdersDesktopScreen(),
  ];

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LogoutCubit(
                  logoutUseCase: getIt.get(),
                ))
      ],
      child: Scaffold(
        body: Row(
          children: [
            // pass the ValueNotifier setter into your drawer
            FurnitureDrawer(
              onItemSelected: (int idx) {
                _selectedIndex.value = idx;
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // listen to the notifier and animate between children
                child: ValueListenableBuilder<int>(
                  valueListenable: _selectedIndex,
                  builder: (context, currentIndex, _) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      transitionBuilder: (child, animation) {
                        // you can customize, e.g. fade + slide
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.1, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      // each child needs a UniqueKey to trigger the switch
                      child: KeyedSubtree(
                        key: ValueKey(currentIndex),
                        child: _screens[currentIndex],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
