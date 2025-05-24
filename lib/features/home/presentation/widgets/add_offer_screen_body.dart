import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/home/presentation/manager/add_offer_cubit/add_offer_cubit.dart';
import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/my_button_widget.dart';
import '../../../../core/widgets/my_text_form_field.dart';

class AddOfferScreenBody extends StatelessWidget {
  const AddOfferScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AddOfferCubit.instance(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const MyBackButton(),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  AppStrings.addOffer,
                  style: AppStyles.textStyle20,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<AddOfferCubit, AddOfferState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(50, 50, 0, 50),
                        child: cubit.pickedImage == null
                            ? DottedBorder(
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
                                            '• Please add clear image of the offer',
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
                              )
                            : Center(
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
                        vertical: 50.0, horizontal: 20),
                    child: Column(
                      children: [
                        MyTextFormField(
                          labelText: 'Offer Name',
                          controller: cubit.offerNameController,
                          validator: ValidatorService.emptyValidator,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextFormField(
                          labelText: 'Offer Description',
                          controller: cubit.offerDescriptionController,
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
                                labelText: 'Offer Price',
                                controller: cubit.offerPriceController,
                                validator: ValidatorService.emptyValidator,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MyTextFormField(
                                labelText: 'Offer Quantity',
                                controller: cubit.offerQuantityController,
                                validator: ValidatorService.emptyValidator,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextFormField(
                          labelText: 'Offer Theme',
                          controller: cubit.offerThemeController,
                          validator: ValidatorService.emptyValidator,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TagFieldWidget(
                          onTagsChanged: (tags) {
                            cubit.updateOfferIds(tags);
                          },
                        ),
                        const SizedBox(height: 10),
                        const Spacer(),
                        BlocConsumer<AddOfferCubit, AddOfferState>(
                          listener: (context, state) {
                            if (state is AddOfferNoProductsSelected) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please select at least one product Id',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            if (state is AddOfferImageNotPicked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please pick an image',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            if(state is AddOfferSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Offer added successfully',),backgroundColor: Colors.green,),
                              );
                              Navigator.pop(context,true);
                            }
                            if(state is AddOfferError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMessage),backgroundColor: Colors.red,),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AddOfferLoading) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: LinearProgressIndicator(
                                  color: AppColors.primary,
                                  backgroundColor: Colors.grey[300],
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        ButtonWidget(
                          label: 'Add Offer',
                          onPressed: cubit.addOffer,
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

class TagFieldWidget extends StatefulWidget {
  final Function(List<String>) onTagsChanged;

  const TagFieldWidget({super.key, required this.onTagsChanged});

  @override
  _TagFieldWidgetState createState() => _TagFieldWidgetState();
}

class _TagFieldWidgetState extends State<TagFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<String> _tags = [];

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addTag(String tag) {
    if (tag.trim().isNotEmpty &&
        int.tryParse(tag.trim()) != null &&
        !_tags.contains(tag.trim())) {
      setState(() {
        _tags.add(tag.trim());
        _controller.clear();
        widget.onTagsChanged(_tags);
        _focusNode.requestFocus(); // Ensure focus returns to TextField
      });
    } else {
      _controller.clear();
      _focusNode.requestFocus(); // Return focus even if tag is invalid
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
      widget.onTagsChanged(_tags);
    });
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                ..._tags.map((tag) => Chip(
                      label: Text(
                        tag,
                        style: const TextStyle(fontSize: 14),
                      ),
                      deleteIcon: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.red,
                      ),
                      onDeleted: () => _removeTag(tag),
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration:  InputDecoration(
                      hintText: 'Enter Product ID ',
                      hintStyle: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    style: const TextStyle(fontSize: 14),
                    onSubmitted: _addTag,
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
