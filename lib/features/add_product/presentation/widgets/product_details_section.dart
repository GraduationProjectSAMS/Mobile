import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../manager/add_product_cubit.dart';
import 'add_product_button.dart';
import 'dimensions_row.dart';
import 'price_and_category_row.dart';
import 'room_and_aesthetic_row.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddProductCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
      child: Column(
        children: [
          MyTextFormField(
            labelText: 'Product Name',
            controller: cubit.productNameController,
            validator: ValidatorService.emptyValidator,
          ),
          const SizedBox(height: 10),
          MyTextFormField(
            labelText: 'Product Description',
            controller: cubit.productDescriptionController,
            minLines: 5,
            maxLines: 5,
            validator: ValidatorService.emptyValidator,
          ),
          const SizedBox(height: 10),
          const PriceAndCategoryRow(),
          const SizedBox(height: 10),
          const DimensionsRow(),
          const SizedBox(height: 10),
          const RoomAndAestheticRow(),
          const Spacer(),
          const AddProductButton(),
        ],
      ),
    );
  }
}
