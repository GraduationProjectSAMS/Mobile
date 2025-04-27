part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

class AddProductImagePicked extends AddProductState {}

class AddProductImageTooLarge extends AddProductState {}

class AddProductImagePickCancelled extends AddProductState {}
