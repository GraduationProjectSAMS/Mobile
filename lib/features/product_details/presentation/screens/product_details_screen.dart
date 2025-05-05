import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/cards/presentation/manager/add_to_card_cubit/add_to_card_cubit.dart';
import 'package:graduation_project/features/favorites/presentation/manager/add_favorite_cubit/add_favorite_cubit.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_details_screen_body_desktop.dart';

import '../../../../core/widgets/app_adaptive_lay_out.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../widgets/product_details_screen_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = context.productDetailsArgs;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: arg.context.read<AddToCardCubit>()),
        BlocProvider.value(value: arg.context.read<AddFavoriteCubit>()),
      ],
      child: Scaffold(
        body: AppAdaptiveLayOut(
          mobileLayOut: (BuildContext context) =>
              const ProductDetailsScreenBody(),
          desktopLayOut: (BuildContext context) =>
              const ProductDetailsScreenBodyDesktop(),
        ),
      ),
    );
  }
}
extension ModalRouteArgumentsExtension on BuildContext {
  ({ProductEntity entity, BuildContext context}) get productDetailsArgs {
    final args = ModalRoute.of(this)?.settings.arguments;
    if (args is ({ProductEntity entity, BuildContext context})) {
      return args;
    } else {
      throw Exception('Invalid arguments for ProductDetailsPage');
    }
  }
}