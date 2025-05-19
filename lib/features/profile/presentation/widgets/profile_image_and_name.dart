import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/profile/domain/entities/user_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/my_cached_network_image.dart';

class ProfileImageAndName extends StatelessWidget {
  const ProfileImageAndName(
      {super.key,
      required this.userEntity,
      this.isLoading = false,
      this.textColor});

  final UserEntity userEntity;
  final bool isLoading;
  final Color? textColor;

  UserEntity get user {
    return isLoading ? UserEntity.loading() : userEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        children: [
          MyCachedNetworkImage(
            isOval: true,
            height: 120.sp,
            width: 120.sp,
            imageUrl: user.image,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 19.sp,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            user.email,
            style: TextStyle(
              fontSize: 14.sp,
              color: textColor ?? Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
