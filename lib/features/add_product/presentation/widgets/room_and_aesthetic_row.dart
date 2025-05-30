import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/app_cusstom_drop_down_menu.dart';
import '../manager/add_product_cubit.dart';

class RoomAndAestheticRow extends StatelessWidget {
  const RoomAndAestheticRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddProductCubit>();
    return Row(
      children: [
        Expanded(
          child: CustomDropDownMenu(
            dropdownItems: const [
              'Living Room',
              'Bedroom',
              'Dining Room',
              'Kitchen',
              'Bathroom',
              'Home Office',
              'Kids Room',
              'Guest Room',
              'Outdoor',
              'Entryway',
              'Laundry Room',
              'Game Room',
            ],
            onChanged: (String? value) => cubit.selectedRoom = value,
            label: 'Room',
            validator: ValidatorService.emptyValidator,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomDropDownMenu(
            dropdownItems: const [
              'Classic',
              'Modern',
              'Scandinavian',
              'Industrial',
              'Bohemian',
              'Rustic',
              'Mid-Century',
              'Minimalist',
              'Contemporary',
              'Japandi',
            ],
            onChanged: (String? value) => cubit.selectedAesthetics = value,
            label: 'Aesthetic',
            validator: ValidatorService.emptyValidator,
          ),
        ),
      ],
    );
  }
}
