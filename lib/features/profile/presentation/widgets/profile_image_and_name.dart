
import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/widgets/my_cached_network_image.dart';

class ProfileImageAndName extends StatelessWidget {
  const ProfileImageAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCachedNetworkImage(
          isOval: true,
          height: 120.sp,
          width: 120.sp,
          imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/social-vape.appspot.com/o/r2eN3MVrYKZBLkIUq9529uAjHLm2%2FuserProfilePhoto%2Fimage_cropper_1692455002427.jpg?alt=media&token=8e2e1db9-de01-42ff-8e60-39e0d0a9abae',
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10),
        Text(
          'Shady Hisham',
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'shady.hesham@gmail.com',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}