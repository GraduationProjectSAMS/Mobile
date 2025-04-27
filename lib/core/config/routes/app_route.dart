import 'package:flutter/material.dart';
import 'package:graduation_project/features/cards/presentation/screens/cards_screen.dart';

import '../../../features/add_product/presentation/screens/add_product_screen.dart';
import '../../../features/authentication/presentation/screens/login_screen.dart';
import '../../../features/authentication/presentation/screens/sign_up_screen.dart';
import '../../../features/favorites/presentation/screens/favorites_screen.dart';
import '../../../features/home/presentation/screens/home_layout.dart';
import '../../../features/product_details/presentation/screens/product_details_screen.dart';

abstract class AppRoutes {
  static const login = '/';
  static const onBoardingRoute = 'onBoarding';
  static const signUpRoute = 'signUp';
  static const homeLayout = 'homeLayout';
  static const productDetails = 'productDetails';
  static const addProduct = 'addProduct';
  static const favorites = 'favorites';
  static const cart = 'cart';
}

abstract class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case AppRoutes.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
        case AppRoutes.addProduct:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());
      case AppRoutes.favorites:
        return MaterialPageRoute( settings: settings,builder: (_) => const FavoritesScreen());
      case AppRoutes.cart:
        return MaterialPageRoute(  settings: settings,  builder: (_) => const CardsScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
