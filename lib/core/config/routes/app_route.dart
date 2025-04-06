import 'package:flutter/material.dart';

import '../../../features/authentication/presentation/screens/login_screen.dart';
import '../../../features/authentication/presentation/screens/sign_up_screen.dart';
import '../../../features/home/presentation/screens/home_layout.dart';
import '../../../features/product_details/presentation/screens/product_details_screen.dart';

abstract class AppRoutes {
  static const login = '/';
  static const homeRoute = '/home';
  static const splashRoute = '/splash';
  static const onBoardingRoute = '/onBoarding';
  static const signUpRoute = '/signUp';
  static const homeLayout = '/homeLayout';
  static const productDetails = '/productDetails';
}

abstract class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
        case AppRoutes.homeLayout:
        return MaterialPageRoute(

            builder: (_) => HomeLayout());
        case AppRoutes.productDetails:
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
