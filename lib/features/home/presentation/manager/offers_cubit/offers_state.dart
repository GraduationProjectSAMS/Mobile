part of 'offers_cubit.dart';

@immutable
sealed class OffersStates {}

final class OffersLoadingState extends OffersStates {}

final class OffersSuccessState extends OffersStates {
  final List<ProductEntity> products;

  OffersSuccessState(this.products);
}

final class OffersErrorState extends OffersStates {
  final String message;

  OffersErrorState(this.message);
}
