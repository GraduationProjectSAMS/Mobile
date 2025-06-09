import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/screens/forget_password_otp_screen.dart';
import 'package:graduation_project/features/authentication/presentation/screens/forget_password_screen.dart';
import 'package:graduation_project/features/cards/presentation/screens/cards_screen.dart';
import 'package:graduation_project/features/home/presentation/screens/add_offer_screen.dart';
import 'package:graduation_project/features/orders/presentation/screens/orders_screen.dart';
import 'package:graduation_project/features/payment/presentation/screens/payment_map_view.dart';
import 'package:graduation_project/features/splash/presentation/views/splash_view.dart';

import '../../../features/add_product/presentation/screens/add_product_screen.dart';
import '../../../features/authentication/presentation/screens/login_screen.dart';
import '../../../features/authentication/presentation/screens/sign_up_screen.dart';
import '../../../features/favorites/presentation/screens/favorites_screen.dart';
import '../../../features/home/presentation/screens/home_layout.dart';
import '../../../features/orders/presentation/screens/order_details_screen.dart';
import '../../../features/payment/presentation/screens/pay_mob_card_screen.dart';
import '../../../features/payment/presentation/screens/payment_screen.dart';
import '../../../features/product_details/presentation/screens/product_details_screen.dart';

abstract class AppRoutes {
  static const login = '/';
  static const splash = 'splash';
  static const onBoardingRoute = 'onBoarding';
  static const signUpRoute = 'signUp';
  static const forgotPasswordRoute = 'forgotPassword';
  static const homeLayout = 'homeLayout';
  static const productDetails = 'productDetails';
  static const addProduct = 'addProduct';
  static const favorites = 'favorites';
  static const cart = 'cart';
  static const payment = 'payment';
  static const paymentMap = 'paymentMap';
  static const payMobCard = 'payMobCard';
  static const orders = 'orders';
  static const addOffers = 'addOffers';
  static const orderDetails = 'orderDetails';
  static const forgetPasswordOtp = 'forgetPasswordOtp';
}

abstract class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.homeLayout:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomeLayout());
      case AppRoutes.productDetails:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ProductDetailsScreen());
      case AppRoutes.addProduct:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());
      case AppRoutes.favorites:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const FavoritesScreen());
      case AppRoutes.cart:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const CardsScreen());
      case AppRoutes.payment:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PaymentScreen());
      case AppRoutes.paymentMap:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PaymentMapView());
      case AppRoutes.payMobCard:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PayMobCardScreen());
      case AppRoutes.orders:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OrdersScreen());
      case AppRoutes.addOffers:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AddOfferScreen());
      case AppRoutes.orderDetails:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OrderDetailsScreen());
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case AppRoutes.forgetPasswordOtp:
        // Assuming you have a screen for handling the OTP for forget password
        return MaterialPageRoute(
          settings: settings,
            builder: (_) => const ForgetPasswordOtpScreen()); // Replace with actual OTP screen

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
