import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../manager/add_product_cubit.dart';

class ImagePickerSection extends StatelessWidget {
  const ImagePickerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        final cubit = context.read<AddProductCubit>();
        return Padding(
          padding: const EdgeInsets.fromLTRB(50, 50, 0, 50),
          child: cubit.pickedImage == null
              ? _ImagePlaceholder(cubit: cubit)
              : _ImagePreview(cubit: cubit),
        );
      },
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  final AddProductCubit cubit;

  const _ImagePlaceholder({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.grey[500]!,
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      dashPattern: const [5, 5, 5, 5],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/images/gallery.png'),
              height: 65.sp,
              width: 65.sp,
            ),
            const SizedBox(height: 10),
            const _ImageInstructions(),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: cubit.pickSingleImage,
              mini: true,
              shape: const CircleBorder(),
              foregroundColor: AppColors.primary,
              backgroundColor: Colors.lightGreen,
              child: Icon(Icons.add, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  final AddProductCubit cubit;

  const _ImagePreview({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 60.hR),
            child: Image.file(cubit.pickedImage!),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: cubit.removeImage,
            child: Text(
              'Remove Image',
              style: TextStyle(fontSize: 12.sp, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageInstructions extends StatelessWidget {
  const _ImageInstructions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('• Please add clear image of the product',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
        Text('• The image should be in JPG or PNG format',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
        Text('• Maximum file size is 3MB',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
      ],
    );
  }
}
