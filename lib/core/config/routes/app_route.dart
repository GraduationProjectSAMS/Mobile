import 'package:flutter/material.dart';

import '../../../features/authentication/presentation/screens/login_screen.dart';
import '../../../features/authentication/presentation/screens/sign_up_screen.dart';
import '../../../features/home/presentation/screens/home_layout.dart';

abstract class AppRoutes {
  static const login = '/';
  static const homeRoute = '/home';
  static const splashRoute = '/splash';
  static const onBoardingRoute = '/onBoarding';
  static const signUpRoute = '/signUp';
  static const homeLayout = '/homeLayout';
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
