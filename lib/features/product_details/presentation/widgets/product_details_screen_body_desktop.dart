import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../../../../core/widgets/my_cached_network_image.dart';

class ProductDetailsScreenBodyDesktop extends StatelessWidget {
  const ProductDetailsScreenBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const MyBackButtonLightMode(),
                  const Spacer(flex: 9,),
                  MyCachedNetworkImage(
                      height: 60.hR,
                      fit: BoxFit.fill,
                      imageUrl:
                      'https://images.pexels.com/photos/3757055/pexels-photo-3757055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  const Spacer(flex: 10,),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
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
                        const Expanded(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
