import 'package:flutter/material.dart';

import '../../../features/authentication/presentation/screens/login_screen.dart';
import '../../../features/authentication/presentation/screens/sign_up_screen.dart';

abstract class AppRoutes {
  static const login = '/';
  static const homeRoute = '/home';
  static const splashRoute = '/splash';
  static const onBoardingRoute = '/onBoarding';
  static const signUpRoute = '/signUp';
}

abstract class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
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
