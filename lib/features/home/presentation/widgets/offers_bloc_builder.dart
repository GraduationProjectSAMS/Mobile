import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/presentation/manager/offers_cubit/offers_cubit.dart';
import 'package:graduation_project/features/home/presentation/widgets/offers_list.dart';

import '../../../../core/widgets/app_api_error_widget.dart';

class OffersBlocBuilder extends StatelessWidget {
  const OffersBlocBuilder({ this.enableHeroTag=true,  this.isAdmin=false,super.key});
  final bool enableHeroTag;
  final bool isAdmin ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersStates>(
      builder: (context, state) {
        final offersCubit = BlocProvider.of<OffersCubit>(context);
        if (state is OffersErrorState) {
          return AppApiErrorWidget(errorMessage: state.message);
        }
        return OffersList(
          isAdmin: isAdmin,
          enableHeroTag: enableHeroTag,
          productsList: offersCubit.offers,
          isLoading: state is OffersLoadingState,
        );
      },
    );
  }
}
