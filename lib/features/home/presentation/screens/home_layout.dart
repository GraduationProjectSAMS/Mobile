import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/cards/presentation/manager/add_to_card_cubit/add_to_card_cubit.dart';
import 'package:graduation_project/features/home/domain/use_cases/get_offers_use_case.dart';
import 'package:graduation_project/features/home/presentation/manager/offers_cubit/offers_cubit.dart';
import 'package:graduation_project/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';

import '../../../cards/domain/use_cases/add_to_card_use_case.dart';
import '../../../cards/domain/use_cases/delete_card_use_case.dart';
import '../../../cards/domain/use_cases/get_cards_use_case.dart';
import '../../../favorites/domain/use_cases/add_to_favorites_use_case.dart';
import '../../../favorites/domain/use_cases/get_favorites_use_case.dart';
import '../../../favorites/presentation/manager/add_favorite_cubit/add_favorite_cubit.dart';
import '../../../orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import '../../../profile/domain/use_cases/get_profile_data_use_case.dart';
import '../../domain/use_cases/get_products_use_case.dart';
import '../manager/products_cubit/product_cubit.dart';
import '../widgets/desktop_body_layout.dart';
import '../widgets/home_mobile_body_layout.dart';
import 'home_adaptive_lay_out.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    /// why i make this because i will make all
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductCubit(getIt.get<GetProductsUseCase>())..getProducts(),
        ),
        BlocProvider(
          create: (context) =>
              OffersCubit(getIt.get<GetOffersUseCase>())..getOffers(),
        ),
        BlocProvider(
          create: (context) => AddFavoriteCubit(
              addToFavoritesUseCase: getIt.get<AddToFavoritesUseCase>(),
              getFavoritesUseCase: getIt.get<GetFavoritesUseCase>())
            ..getFavorites(),
        ),
        BlocProvider(
          create: (context) => AddToCardCubit(
              deleteCardUseCase: getIt.get<DeleteCardUseCase>(),
              addToCardUseCase: getIt.get<AddToCardUseCase>(),
              getCardsUseCase: getIt.get<GetCardsUseCase>())
            ..getCards(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              ProfileCubit(getIt.get<GetProfileDataUseCase>())..getUserData(),
        ),
        BlocProvider(
          create: (context) =>
              GetOrdersCubit(getOrdersUseCase: getIt.get())..getOrders(),
        ),
      ],
      child: HomeAdaptiveLayOut(
        mobileLayOut: (BuildContext context) => const HomeMobileBodyLayout(),
        desktopLayOut: (BuildContext context) => const DesktopBodyLayout(),
      ),
    );
  }
}
