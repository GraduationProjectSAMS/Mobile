part of 'add_to_card_cubit.dart';

@immutable
sealed class AddToCardStates {}

final class AddToCardInitial extends AddToCardStates {}

final class AddToCardLoading extends AddToCardStates {}

final class GetCardSuccess extends AddToCardStates {
  final List<ProductEntity> products;

  GetCardSuccess(this.products);
}

final class GetCardError extends AddToCardStates {
  final String errorMessage;

  GetCardError(this.errorMessage);
}

final class AddToCardError extends AddToCardStates {
  final String errorMessage;

  AddToCardError(this.errorMessage);
}
