import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';

import '../../../../core/widgets/height_sized_box.dart';

class AppExitDialogContent extends StatelessWidget {
  const AppExitDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 25.sp,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 27.sp,
          ),
        ),
        const HeightSizedBox(height: 3),
        Text(
          AppStrings.exitApp,
          style: AppStyles.textStyle14,
        ),
        const HeightSizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyTextButton(
              onTap: () => context.pop(),
              text: AppStrings.no,
            ),
            const MyTextButton(
              onTap: SystemNavigator.pop,
              text: AppStrings.yes,
            ),
          ],
        ),
      ],
    );
  }
}
