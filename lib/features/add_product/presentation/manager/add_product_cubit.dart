import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  static AddProductCubit instance(context) => BlocProvider.of(context);

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController =
      TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String? selectedCategory;
  String? selectedAesthetics ;
  String? selectedRoom;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? pickedImage;

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
}
