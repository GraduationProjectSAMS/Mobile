import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/use_cases/add_offer_use_case.dart';

part 'add_offer_state.dart';

class AddOfferCubit extends Cubit<AddOfferState> {
  final AddOfferUseCase addOfferUseCase;

  AddOfferCubit({
    required this.addOfferUseCase,
  }) : super(AddOfferInitial());

  static AddOfferCubit instance(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? pickedImage;
  TextEditingController offerNameController = TextEditingController();
  TextEditingController offerDescriptionController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();
  TextEditingController offerQuantityController = TextEditingController();
  TextEditingController offerThemeController = TextEditingController();

  Future<void> pickSingleImage() async {
    final picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File imageFile = File(image.path);
      final int imageSize = await imageFile.length(); // size in bytes

      // Check if image is <= 3MB
      if (imageSize <= 3 * 1024 * 1024) {
        pickedImage = imageFile;
        emit(AddOfferImagePicked());
      } else {
        emit(AddOfferImageTooLarge());
      }
    } else {
      emit(AddOfferImagePickCancelled());
    }
  }

  void removeImage() {
    pickedImage = null;
    emit(AddOfferImagePickCancelled());
  }

  List<String> offerIds = [];
  final TextEditingController offerIdInputController = TextEditingController();

  void updateOfferIds(List<String> newIds) {
    offerIds = List.from(newIds);
    emit(AddOfferUpdated());
  }

  Future<void> addOffer() async {
    if (formKey.currentState!.validate()) {
      if (pickedImage == null) {
        emit(AddOfferImageNotPicked());
        return;
      }
      if (offerIds.isEmpty) {
        emit(AddOfferNoProductsSelected());
        return;
      }
      formKey.currentState!.save();
      emit(AddOfferLoading());
      final data = {
        'title': offerNameController.text,
        'description': offerDescriptionController.text,
        'price': offerPriceController.text,
        'quantity': offerQuantityController.text,
        'theme': offerThemeController.text,
        'photo': await MultipartFile.fromFile(
          pickedImage!.path,
          filename: pickedImage!.path.split('/').last,
        ),
        for (int i = 0; i < offerIds.length; i++)
          'product_ids[$i]': offerIds[i],
      };
      final result =
          await addOfferUseCase(offerData: data, onSendProgress: onUploadImage);
      result.fold(
        (failure) {
          emit(AddOfferError(failure.errorMessage));
        },
        (success) => emit(AddOfferSuccess()),
      );
    }
  }

  void onUploadImage(progress, total) {
    emit(AddOfferLoading(progress: progress / total));
  }
}
