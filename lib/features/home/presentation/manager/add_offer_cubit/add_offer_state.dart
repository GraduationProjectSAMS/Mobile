part of 'add_offer_cubit.dart';

@immutable
sealed class AddOfferState {}

final class AddOfferInitial extends AddOfferState {}

class AddProductImagePicked extends AddOfferState {}

class AddProductImageTooLarge extends AddOfferState {}

class AddProductImagePickCancelled extends AddOfferState {}

class AddProductLoading extends AddOfferState {}

class AddProductSuccess extends AddOfferState {}

class AddProductImageNotPicked extends AddOfferState {}

class AddOfferUpdated extends AddOfferState {}
