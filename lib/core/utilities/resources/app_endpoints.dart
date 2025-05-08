import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';

abstract class AppEndpoints {

  static const login = 'auth/login';
  static const signUp = 'auth/signup';
  static const loginWithGoogle = 'auth/google/callback';
  static const getProducts = 'products';
  static const getOffers = 'offers';
  static const addToFavorite = 'wishlists';
  static const addToCart = 'carts';
  static const profile ='users';
  static const logout ='auth/logout';
  static final baseUrl = dotenv.env[AppConstants.baseUrlKey]??'';
  static final payMobSecretKey = dotenv.env[AppConstants.payMobSecretKey]??'';
static final payMobPublicKey=dotenv.env[AppConstants.payMobPublicKey]??'';
static final paymentBaseUrl=dotenv.env[AppConstants.paymentBaseUrlKey]??'';
static const clientSecretKey='v1/intention/';



}
