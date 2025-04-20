import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_color_selector.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_counter_widget.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_details_image_with_app_bar.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const ProductDetailsImageWithAppBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Sofa with Pillows',
                          style: AppStyles.textStyle18
                              .copyWith(fontSize: 20)
                              .copyWith(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$200',
                            style: AppStyles.textStyle18.copyWith(
                              color: Colors.green.shade800,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '\$250',
                            style: AppStyles.textStyle14.copyWith(
                              color: AppColors.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'Modern, Seats ',
                    style: AppStyles.textStyle14.copyWith(
                        color: Colors.green.shade800,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: 4.5,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemSize: 20.sp,
                        unratedColor: AppColors.grey.withOpacity(0.3),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '4.5',
                        style: AppStyles.textStyle14.copyWith(
                            color: AppColors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '(100)',
                        style: AppStyles.textStyle14
                            .copyWith(color: AppColors.grey, fontSize: 13.sp),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '300 x 200 cm, 100 cm Height',
                    style: AppStyles.textStyle14.copyWith(
                        color: AppColors.black.withOpacity(0.6),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: AppColors.black.withOpacity(0.3),
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Description',
                    style: AppStyles.textStyle14.copyWith(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here',
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style:
                        AppStyles.textStyle14.copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductColorSelector(
                        availableColors: const [
                          Color(0xFFC2C0C0), // light gray
                          Color(0xFF6B4F3B), // brown
                          Color(0xFF3A3A3A), // dark gray
                        ],
                        initialColor: const Color(0xFFC2C0C0),
                        onColorSelected: (color) {
                          print('Selected color: $color');
                        },
                      ),
                      ProductCounter(
                        onChanged: (value) {
                          // Handle the value change
                        },
                      ),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          height: 45,
                          label: 'Buy Now',
                          onPressed: () {},
                          isShowArrow: true,
                          labelFontSize: 15.sp,
                          borderRadius: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.5),
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.primary,
                          size: 24.sp,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.5),
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: AppColors.primary,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
