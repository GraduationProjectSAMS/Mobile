import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../utilities/resources/app_colors.dart';

class MyBottomNavigationBarTheme{
  static var light = NavigationBarThemeData(
    backgroundColor:AppColors.white,

    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
      if (states.contains(WidgetState.selected)) {
        return TextStyle(
          fontSize: 14.sp,
          color: AppColors.primary,
        );
      }
      return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      );
    }),
  );
}