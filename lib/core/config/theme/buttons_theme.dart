import 'package:flutter/material.dart';

import '../../utilities/resources/app_colors.dart';
import '../../utilities/resources/app_dimensions.dart';
import '../../utilities/resources/app_styles.dart';

abstract class ButtonsTheme {
  static ElevatedButtonThemeData elevatedButtonLightTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.primary,
      textStyle: AppStyles.textStyle14,
      foregroundColor: AppColors.white,
      minimumSize: const Size.fromHeight(
        AppDimensions.buttonHeight,
      ),
    ),
  );
}
