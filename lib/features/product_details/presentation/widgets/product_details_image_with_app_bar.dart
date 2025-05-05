import 'package:flutter/material.dart';

import '../../../../core/widgets/my_button_widget.dart';
import '../../../../core/widgets/my_cached_network_image.dart';

class ProductDetailsImageWithAppBar extends StatelessWidget {
  const ProductDetailsImageWithAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyBackButton(),
        SizedBox(
          height: 10,
        ),
        MyCachedNetworkImage(
            height: 200,
            fit: BoxFit.fill,
            imageUrl:
                'https://images.pexels.com/photos/3757055/pexels-photo-3757055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
      ],
    );
  }
}
