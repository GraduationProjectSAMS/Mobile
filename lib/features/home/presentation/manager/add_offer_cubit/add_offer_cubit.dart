import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_offer_state.dart';

class AddOfferCubit extends Cubit<AddOfferState> {
  AddOfferCubit() : super(AddOfferInitial());

  static AddOfferCubit instance(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? pickedImage;
  TextEditingController offerNameController = TextEditingController();
  TextEditingController offerDescriptionController =
      TextEditingController();
  TextEditingController offerPriceController = TextEditingController();

  Future<void> pickSingleImage() async {
    final picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File imageFile = File(image.path);
      final int imageSize = await imageFile.length(); // size in bytes

      // Check if image is <= 3MB
      if (imageSize <= 3 * 1024 * 1024) {
        pickedImage = imageFile;
        emit(AddProductImagePicked());
      } else {
        emit(AddProductImageTooLarge());
      }
    } else {
      emit(AddProductImagePickCancelled());
    }
  }

  void removeImage() {
    pickedImage = null;
    emit(AddProductImagePickCancelled());
  }
  List<String> offerIds = [];
  final TextEditingController offerIdInputController = TextEditingController();


  void updateOfferIds(List<String> newIds) {
    offerIds = List.from(newIds);
    emit(AddOfferUpdated());
  }

}
