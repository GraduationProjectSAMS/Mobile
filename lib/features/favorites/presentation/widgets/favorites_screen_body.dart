import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';

import '../../../../core/widgets/my_app_bar.dart';
import 'favorites_bloc_builder.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: MyAppBar(
              title: AppStrings.favorites,
            ),
          ),
          Expanded(child: FavoritesBlocBuilder()),
        ],
      ),
    );
  }
}
