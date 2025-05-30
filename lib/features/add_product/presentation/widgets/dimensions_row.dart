import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../manager/add_product_cubit.dart';

class DimensionsRow extends StatelessWidget {
  const DimensionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddProductCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MyTextFormField(
            labelText: 'Length',
            controller: cubit.lengthController,
            keyboardType: TextInputType.number,
            validator: ValidatorService.emptyValidator,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: Text('Cm',
                style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MyTextFormField(
            labelText: 'Width',
            controller: cubit.widthController,
            keyboardType: TextInputType.number,
            validator: ValidatorService.emptyValidator,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: Text('Cm',
                style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MyTextFormField(
            labelText: 'Height',
            controller: cubit.heightController,
            keyboardType: TextInputType.number,
            validator: ValidatorService.emptyValidator,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: Text('Cm',
                style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
