import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/widgets/add_button.dart';
import 'package:graduation_project/features/home/presentation/manager/offers_cubit/offers_cubit.dart';
import 'package:graduation_project/features/home/presentation/widgets/offers_bloc_builder.dart';

import '../../../../core/utilities/resources/app_styles.dart';

class OffersDesktopScreen extends StatelessWidget {
  const OffersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.allOffers,
                style: AppStyles.textStyle20,
              ),
              AddButton(text: AppStrings.addOffer, onPressed: () {
                context.navigateTo(pageName: AppRoutes.addOffers).then(
                  (value) {
                    if (value == true) {
                      OffersCubit.instance(context).refreshOffers();
                    }
                  },
                );
              })
            ],
          ),
        ),
        const Expanded(
            child: OffersBlocBuilder(
          isAdmin: true,
        )),
      ],
    );
  }
}
