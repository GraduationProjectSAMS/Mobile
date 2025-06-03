import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/add_product/presentation/manager/add_product_cubit.dart';

import 'add_product_header.dart';
import 'image_picker_section.dart';
import 'product_details_section.dart';

class AddProductScreenBody extends StatelessWidget {
  const AddProductScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddProductCubit>();
    return Form(
      key: cubit.formKey,
      child: const Column(
        children: [
          AddProductHeader(),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ImagePickerSection()),
                SizedBox(width: 20),
                Expanded(child: ProductDetailsSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
