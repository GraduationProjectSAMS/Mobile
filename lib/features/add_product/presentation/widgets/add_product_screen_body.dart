import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/widgets/app_cusstom_drop_down_menu.dart';
import 'package:graduation_project/core/widgets/my_text_form_field.dart';
import 'package:graduation_project/features/add_product/presentation/manager/add_product_cubit.dart';

import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/my_button_widget.dart';

class AddProductScreenBody extends StatelessWidget {
  const AddProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AddProductCubit.instance(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Row(
              children: [
                MyBackButton(),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Add Product',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<AddProductCubit, AddProductState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(70, 70, 0, 70),
                        child: cubit.pickedImage == null ? DottedBorder(
                          color: Colors.grey[500]!,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [5, 5, 5, 5],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: const AssetImage(
                                    'assets/images/gallery.png',
                                  ),
                                  height: 65.sp,
                                  width: 65.sp,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '• Please add clear image of the product',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      '• The image should be in JPG or PNG format',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      '• Maximum file size is 3MB',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FloatingActionButton(
                                  onPressed: cubit.pickSingleImage,
                                  mini: true,
                                  shape: const CircleBorder(),
                                  foregroundColor: AppColors.primary,
                                  backgroundColor: Colors.lightGreen,
                                  child: Icon(
                                    Icons.add,
                                    size: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ) : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxHeight: 60.hR,
                                ),
                                child: Image.file(
                                  cubit.pickedImage!,

                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // remove image text button
                              TextButton(
                                onPressed: cubit.removeImage,
                                child: Text(
                                  'Remove Image',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70.0, horizontal: 20),
                    child: Column(
                      children: [
                        MyTextFormField(
                          labelText: 'Product Name',
                          controller: cubit.productNameController,
                          validator: ValidatorService.emptyValidator,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextFormField(
                          labelText: 'Product Description',
                          controller: cubit.productDescriptionController,
                          minLines: 5,
                          maxLines: 5,
                          validator: ValidatorService.emptyValidator,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextFormField(
                                labelText: 'Price',
                                controller: cubit.productPriceController,
                                keyboardType: TextInputType.number,
                                validator: ValidatorService.emptyValidator,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
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
                                onChanged: (String? value) {
                                  cubit.selectedCategory = value;
                                },
                                label: 'Category',
                                validator: ValidatorService.emptyValidator,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextFormField(
                                labelText: 'Length',
                                controller: cubit.lengthController,
                                keyboardType: TextInputType.number,
                                validator: ValidatorService.emptyValidator,
                                suffix: Text(
                                  'Cm',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MyTextFormField(
                                labelText: 'Width',
                                controller: cubit.widthController,
                                keyboardType: TextInputType.number,
                                validator: ValidatorService.emptyValidator,
                                suffix: Text(
                                  'Cm',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MyTextFormField(
                                labelText: 'Height',
                                controller: cubit.heightController,
                                keyboardType: TextInputType.number,
                                validator: ValidatorService.emptyValidator,
                                suffix: Text(
                                  'Cm',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
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
                                onChanged: (String? value) {
                                  cubit.selectedRoom = value;
                                },
                                label: 'Room',
                                validator: ValidatorService.emptyValidator,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
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
                                onChanged: (String? value) {
                                  cubit.selectedAesthetics = value;
                                },
                                label: 'Aesthetic',
                                validator: ValidatorService.emptyValidator,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ButtonWidget(
                          label: 'Add Product',
                          onPressed: () {

                          },
                          width: double.infinity,
                          height: 37.sp,
                          labelFontSize: 13.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
