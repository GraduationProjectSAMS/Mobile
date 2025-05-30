import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/app_cusstom_drop_down_menu.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../manager/add_product_cubit.dart';

class PriceAndCategoryRow extends StatelessWidget {
  const PriceAndCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddProductCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MyTextFormField(
            labelText: 'Price',
            controller: cubit.productPriceController,
            keyboardType: TextInputType.number,
            validator: ValidatorService.emptyValidator,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: Text('EGP',
                style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomDropDownMenu(
            dropdownItems: const [
              'Sofas & Couches',
              'Chairs',
              'Tables',
              'Beds',
              'Dressers & Drawers',
              'Wardrobes & Closets',
              'Desks',
              'TV Stands & Media Units',
              'Shelves & Bookcases',
              'Cabinets',
              'Dining Sets',
              'Outdoor Furniture',
              'Office Furniture',
              'Kids\' Furniture',
              'Accent Furniture',
            ],
            onChanged: (String? value) => cubit.selectedCategory = value,
            label: 'Category',
            validator: ValidatorService.emptyValidator,
          ),
        ),
      ],
    );
  }
}
