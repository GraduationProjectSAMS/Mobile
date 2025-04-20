import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/core/widgets/app_adaptive_lay_out.dart';
import 'package:graduation_project/features/home/domain/use_cases/get_offers_use_case.dart';
import 'package:graduation_project/features/home/presentation/manager/offers_cubit/offers_cubit.dart';

import '../../domain/use_cases/get_products_use_case.dart';
import '../manager/products_cubit/product_cubit.dart';
import '../widgets/desktop_body_layout.dart';
import '../widgets/home_mobile_body_layout.dart';

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
        ],
        child: AppAdaptiveLayOut(
          mobileLayOut: (BuildContext context) => const HomeMobileBodyLayout(),
          desktopLayOut: (BuildContext context) => const DesktopBodyLayout(),
        ));
  }
}
