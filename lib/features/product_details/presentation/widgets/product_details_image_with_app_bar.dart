import 'package:flutter/material.dart';
import 'package:graduation_project/features/product_details/presentation/screens/product_details_screen.dart';

import '../../../../core/widgets/my_button_widget.dart';
import '../../../../core/widgets/my_cached_network_image.dart';

class ProductDetailsImageWithAppBar extends StatelessWidget {
  const ProductDetailsImageWithAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = context.productDetailsArgs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyBackButton(),
        const SizedBox(
          height: 10,
        ),
        Hero(
          tag: '${arg.entity.id}${arg.entity.type}',
          child: MyCachedNetworkImage(
              height: 200, fit: BoxFit.fill, imageUrl: arg.entity.imageUrl),
        ),
      ],
    );
  }
}
