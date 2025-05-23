import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project/core/utilities/services/api_service.dart';
import 'package:graduation_project/core/utilities/services/payment_api_service.dart';
import 'package:graduation_project/features/cards/data/data_sources/cards_remote_repo_impl.dart';
import 'package:graduation_project/features/cards/data/repositories/cards_repo_impl.dart';
import 'package:graduation_project/features/favorites/data/data_sources/favorites_remote_repo_impl.dart';
import 'package:graduation_project/features/favorites/data/repositories/favorites_repo_impl.dart';
import 'package:graduation_project/features/home/data/data_sources/home_remote_repo_impl.dart';
import 'package:graduation_project/features/orders/data/data_sources/orders_remote_repo_impl.dart';
import 'package:graduation_project/features/orders/data/repositories/orders_repo_impl.dart';
import 'package:graduation_project/features/profile/data/data_sources/profile_remote_repo_impl.dart';
import 'package:graduation_project/features/profile/data/repositories/profile_repo_impl.dart';
import '../../../features/add_product/data/data_sources/add_product_remote_repo_impl.dart';
import '../../../features/add_product/data/repositories/add_product_repo_impl.dart';
import '../../../features/authentication/data/data_sources/authentication_remote_repo_impl.dart';
import '../../../features/authentication/data/repo/authentication_repo_impl.dart';
import '../../../features/authentication/domain/use_case/login_with_email_and_password_use_case.dart';
import '../../../features/authentication/domain/use_case/send_google_token_to_back_end_use_case.dart';
import '../../../features/authentication/domain/use_case/sign_in_with_google_use_case.dart';
import '../../../features/authentication/domain/use_case/signup_with_gmail_use_case.dart';
import '../../../features/cards/domain/use_cases/add_to_card_use_case.dart';
import '../../../features/cards/domain/use_cases/delete_card_use_case.dart';
import '../../../features/cards/domain/use_cases/get_cards_use_case.dart';
import '../../../features/favorites/domain/use_cases/add_to_favorites_use_case.dart';
import '../../../features/home/data/repositories/home_repo_impl.dart';

import '../../../features/favorites/domain/use_cases/get_favorites_use_case.dart';
import '../../../features/home/domain/use_cases/get_offers_use_case.dart';
import '../../../features/home/domain/use_cases/get_products_use_case.dart';
import '../../../features/orders/domain/use_cases/create_order_use_case.dart';
import '../../../features/orders/domain/use_cases/get_current_order_location_use_case.dart';
import '../../../features/orders/domain/use_cases/get_orders_use_case.dart';
import '../../../features/orders/domain/use_cases/set_order_location_use_case.dart';
import '../../../features/payment/data/data_sources/payment_remote_repo_impl.dart';
import '../../../features/payment/data/repositories/payment_repo_impl.dart';
import '../../../features/payment/domain/use_cases/get_pay_mob_client_key_use_case.dart';
import '../../../features/profile/domain/use_cases/get_profile_data_use_case.dart';
import '../../../features/profile/domain/use_cases/logout_form_google_use_case.dart';
import '../../../features/profile/domain/use_cases/logout_use_case.dart';
import 'google_sign_in_service.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  /// Services
  getIt.registerLazySingleton<GoogleSignInService>(
      () => GoogleSignInService(GoogleSignIn()));
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  getIt.registerLazySingleton<PaymentApiService>(() => PaymentApiService(Dio()));

  /// Repositories
  getIt.registerLazySingleton<AuthenticationRepoImpl>(() =>
      AuthenticationRepoImpl(AuthenticationRemoteRepoImpl(
          getIt.get<GoogleSignInService>(), getIt.get<ApiService>())));

  getIt.registerLazySingleton<HomeRepoImpl>(
      () => HomeRepoImpl(HomeRemoteRepoImpl(getIt.get<ApiService>())));
  getIt.registerLazySingleton<FavoritesRepoImpl>(
      () => FavoritesRepoImpl(
          FavoritesRemoteRepoImpl(getIt.get<ApiService>())));

  getIt.registerLazySingleton<CardsRepoImpl>(
          () => CardsRepoImpl(
              CardsRemoteRepoImpl(getIt.get<ApiService>())));
  getIt.registerLazySingleton<AddProductRepoImpl>(() =>
      AddProductRepoImpl(AddProductRemoteRepoImpl(getIt.get<ApiService>())));
  getIt.registerLazySingleton<ProfileRepoImpl>(
          () => ProfileRepoImpl(
          ProfileRemoteRepoImpl(getIt.get<ApiService>(),getIt.get<GoogleSignInService>())));
  getIt.registerLazySingleton<PaymentRepoImpl>(
          () => PaymentRepoImpl(
          PaymentRemoteRepoImpl(getIt.get<PaymentApiService>())));
  getIt.registerLazySingleton<OrdersRepoImpl>(
          () => OrdersRepoImpl(
          OrdersRemoteRepoImpl(getIt.get<ApiService>())));
  /// Use Cases
  getIt.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(getIt.get<AuthenticationRepoImpl>()));
  getIt.registerLazySingleton<SignupWithGmailUseCase>(
      () => SignupWithGmailUseCase(getIt.get<AuthenticationRepoImpl>()));
  getIt.registerLazySingleton<LoginWithEmailAndPasswordUseCase>(() =>
      LoginWithEmailAndPasswordUseCase(getIt.get<AuthenticationRepoImpl>()));
  getIt.registerLazySingleton<SendGoogleTokenToBackEndUseCase>(() =>
      SendGoogleTokenToBackEndUseCase(getIt.get<AuthenticationRepoImpl>()));
  getIt.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(getIt.get<HomeRepoImpl>()));
  getIt.registerLazySingleton<GetOffersUseCase>(
      () => GetOffersUseCase(getIt.get<HomeRepoImpl>()));
  getIt.registerLazySingleton<AddToFavoritesUseCase>(
          () => AddToFavoritesUseCase(getIt.get<FavoritesRepoImpl>()));
  getIt.registerLazySingleton<GetFavoritesUseCase>(
          () => GetFavoritesUseCase(getIt.get<FavoritesRepoImpl>()));
  getIt.registerLazySingleton<AddToCardUseCase>(
          () => AddToCardUseCase(getIt.get<CardsRepoImpl>()));
  getIt.registerLazySingleton<GetCardsUseCase>(
          () => GetCardsUseCase(getIt.get<CardsRepoImpl>()));
  getIt.registerLazySingleton<DeleteCardUseCase>(
          () => DeleteCardUseCase(getIt.get<CardsRepoImpl>()));
  getIt.registerLazySingleton<GetProfileDataUseCase>(
          () => GetProfileDataUseCase(getIt.get<ProfileRepoImpl>()));
  getIt.registerLazySingleton<LogoutFormGoogleUseCase>(
          () => LogoutFormGoogleUseCase(getIt.get<ProfileRepoImpl>()));
  getIt.registerLazySingleton<LogoutUseCase>(
          () => LogoutUseCase(getIt.get<ProfileRepoImpl>()));
  getIt.registerLazySingleton<GetPayMobClientKeyUseCase>(
          () => GetPayMobClientKeyUseCase(getIt.get<PaymentRepoImpl>()));
  getIt.registerLazySingleton<GetOrdersUseCase>(
          () => GetOrdersUseCase(getIt.get<OrdersRepoImpl>()));
  getIt.registerLazySingleton<SetOrderLocationUseCase>(
          () => SetOrderLocationUseCase(getIt.get<OrdersRepoImpl>()));
  getIt.registerLazySingleton<GetCurrentOrderLocationUseCase>(
          () => GetCurrentOrderLocationUseCase(getIt.get<OrdersRepoImpl>()));
  getIt.registerLazySingleton<CreateOrderUseCase>(
          () => CreateOrderUseCase(getIt.get<OrdersRepoImpl>()));

}
