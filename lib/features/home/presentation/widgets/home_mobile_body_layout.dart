import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/functions/show_dialog.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/icon_broken.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:graduation_project/features/home/presentation/manager/offers_cubit/offers_cubit.dart';
import 'package:graduation_project/features/home/presentation/manager/products_cubit/product_cubit.dart';
import 'package:graduation_project/features/home/presentation/screens/home_screen.dart';
import 'package:graduation_project/features/home/presentation/screens/products_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/profile_screen.dart';
import 'package:nested/nested.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../cards/presentation/manager/add_to_card_cubit/add_to_card_cubit.dart';
import '../../../favorites/presentation/manager/add_favorite_cubit/add_favorite_cubit.dart';
import '../screens/offers_screen.dart';
import 'app_exit_dialog_content.dart';
import 'home_app_bar.dart';

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

  void _syncProductsToManagement(
      BuildContext context, List<ProductEntity> products) {
    final addFavoriteCubit = BlocProvider.of<AddFavoriteCubit>(context);

    addFavoriteCubit.productsKeys.addAll(
      products.asMap().map(
            (key, value) =>
                MapEntry('${value.id}${value.type}', value.isFavorite),
          ),
    );
  }
  Future<void> _refreshData(BuildContext context) async {
    await Future.wait([
      context.read<ProductCubit>().getProducts(),
      context.read<OffersCubit>().getOffers(),
      context.read<AddToCardCubit>().getCards(),
      context.read<AddFavoriteCubit>().getFavorites(),
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop, _) => showAppExitDialog(canPop, context),
      child: MultiBlocListener(
        listeners: listeners,
        child: Scaffold(
          backgroundColor: AppColors.offWhite,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () => _refreshData(context)

              ,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Column(
                  key: ValueKey<int>(_selectedIndex),
                  children: [
                    if (_selectedIndex != 3)
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: HomeAppBar(),
                      ),
                    Expanded(child: _screens[_selectedIndex])
                  ],
                ),
              ),
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
          ),
        ),
      ),
    );
  }

  void showAppExitDialog(bool canPop, BuildContext context) {
    if (!canPop) {
      showAppDialog(context: context, child: const AppExitDialogContent());
    }
  }

  List<SingleChildWidget> get listeners {
    return [
      BlocListener<ProductCubit, ProductStates>(
        listener: (context, state) {
          if (state is ProductSuccessStates) {
            _syncProductsToManagement(context, state.products);
          } else if (state is ViewAllProductsStates) {
            setState(() {
              _selectedIndex = 1;
            });
          }
        },
      ),
      BlocListener<OffersCubit, OffersStates>(
        listener: (context, state) {
          if (state is OffersSuccessState) {
            _syncProductsToManagement(context, state.products);
          } else if (state is ViewAllOffersStates) {
            setState(() {
              _selectedIndex = 2;
            });
          }
        },
      ),
    ];
  }
}
