import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/utilities/functions/my_toast.dart';
import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/services/overlay_progress_service.dart';
import '../../../../core/widgets/my_button_widget.dart';
import '../manager/add_product_cubit.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductImageNotPicked) {
          showAdaptiveToast(
              context: context,
              msg: 'Please pick an image',
              state: ToastStates.error);
        }
        if (state is AddProductSuccess) {
          OverlayProgressService.hide();
          showAdaptiveToast(
            context: context,
            msg: 'Product added successfully',
            state: ToastStates.success,
          );
          Navigator.pop(context, true);
        }
        if (state is AddProductError) {
          OverlayProgressService.hide();
          showAdaptiveToast(
            context: context,
            msg: state.errorMessage,
            state: ToastStates.error,
          );
        }
        if (state is AddProductLoading) {
          OverlayProgressService.show(
            context,
            progress: state.progress?.toDouble() ?? 0.0,
            message: 'Adding product...',
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<AddProductCubit>();
        if (state is AddProductLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: LinearProgressIndicator(
              color: AppColors.primary,
              backgroundColor: Colors.grey[300],
            ),
          );
        }
        return ButtonWidget(
          label: 'Add Product',
          onPressed: cubit.addProduct,
          width: double.infinity,
          height: 37.sp,
          labelFontSize: 13.sp,
        );
      },
    );
  }
}
