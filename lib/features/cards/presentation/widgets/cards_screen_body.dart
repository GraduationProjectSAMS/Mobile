import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/widgets/my_app_bar.dart';

import 'card_bloc_builder.dart';

class CardsScreenBody extends StatelessWidget {
  const CardsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: MyAppBar(title: AppStrings.myCart),
          ),
          Expanded(child: CardBlocBuilder()),
        ],
      ),
    );
  }
}
