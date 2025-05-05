part of 'add_favorite_cubit.dart';

@immutable
sealed class AddFavoriteStates {}

final class AddFavoriteInitial extends AddFavoriteStates {}

final class AddFavoriteLoading extends AddFavoriteStates {}

final class AddFavoriteSuccess extends AddFavoriteStates {}


final class AddFavoriteError extends AddFavoriteStates {
  final String errorMessage;

  AddFavoriteError(this.errorMessage);
}

final class GetFavoritesErrorState extends AddFavoriteStates {
  final String errorMessage;

  GetFavoritesErrorState(this.errorMessage);
}
