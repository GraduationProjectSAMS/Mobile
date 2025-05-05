import 'package:flutter/material.dart';

import '../../../../core/widgets/my_cached_network_image.dart';

class OffersItem extends StatelessWidget {
  const OffersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          MyCachedNetworkImage(
              fit: BoxFit.fill,
              width: 100,
              height: 100,
              imageUrl:
                  'https://images.pexels.com/photos/3757055/pexels-photo-3757055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
          Expanded(
            child: Column(
              children: [
                Text('Product Name'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
