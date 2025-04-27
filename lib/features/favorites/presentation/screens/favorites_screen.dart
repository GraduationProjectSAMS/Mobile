import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/cards/presentation/manager/add_to_card_cubit/add_to_card_cubit.dart';
import 'package:graduation_project/features/favorites/presentation/manager/add_favorite_cubit/add_favorite_cubit.dart';

import '../widgets/favorites_screen_body.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as ({
      BuildContext context,
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: arg.context.read<AddFavoriteCubit>()..getFavorites(),
        ),
        BlocProvider.value(
          value: arg.context.read<AddToCardCubit>()..getCards()
        ),
      ],
      child: const Scaffold(
        body: FavoritesScreenBody(),
      )
    );
  }
}
