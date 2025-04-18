import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/app_api_error_widget.dart';
import 'package:graduation_project/features/home/presentation/manager/offers_cubit/offers_cubit.dart';

import 'home_offers_list.dart';

class HomeOffersBlocBuilder extends StatelessWidget {
  const HomeOffersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersStates>(
      builder: (context, state) {
        final offersCubit = BlocProvider.of<OffersCubit>(context);
        if (state is OffersErrorState) {
          return AppApiErrorWidget(errorMessage: state.message);
        }
        return HomeOffersList(
          offersList: offersCubit.homeOffers,
          isLoading: state is OffersLoadingState,
        );
      },
    );
  }
}
