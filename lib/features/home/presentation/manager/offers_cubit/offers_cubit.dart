import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:graduation_project/features/home/domain/use_cases/get_offers_use_case.dart';
import 'package:logger/logger.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersStates> {
  OffersCubit(this._getOffersUseCase) : super(OffersLoadingState());
  final GetOffersUseCase _getOffersUseCase;

  List<ProductEntity> offers = [];

  List<ProductEntity> homeOffers = [];

  Future<void> getOffers() async {
    emit(OffersLoadingState());
    final result = await _getOffersUseCase.getOffers();
    result.fold(
      (failure) => emit(OffersErrorState(failure.errorMessage)),
      (offers) {
        this.offers = offers;
        Logger().i(offers.length);
        homeOffers = this
            .offers
            .sublist(0, this.offers.length > 5 ? 5 : this.offers.length);

        emit(OffersSuccessState());
      },
    );
  }
}
