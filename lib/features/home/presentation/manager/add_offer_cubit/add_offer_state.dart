part of 'add_offer_cubit.dart';

@immutable
sealed class AddOfferState {}

final class AddOfferInitial extends AddOfferState {}

class AddOfferImagePicked extends AddOfferState {}

class AddOfferImageTooLarge extends AddOfferState {}

class AddOfferImagePickCancelled extends AddOfferState {}

class AddOfferLoading extends AddOfferState {
  final double? progress;

  AddOfferLoading({this.progress});
}

class AddOfferSuccess extends AddOfferState {}

class AddOfferImageNotPicked extends AddOfferState {}

class AddOfferUpdated extends AddOfferState {}

class AddOfferNoProductsSelected extends AddOfferState {}

class AddOfferError extends AddOfferState {
  final String errorMessage;

  AddOfferError(this.errorMessage);
}
