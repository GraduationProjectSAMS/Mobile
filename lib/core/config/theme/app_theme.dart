import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';

import '../../utilities/resources/app_colors.dart';
import 'buttons_theme.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    splashColor: AppColors.white,
    splashFactory: InkSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: ThemeData.light()
        .textTheme
        .copyWith(
          headlineSmall: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor),
          bodyLarge:
              const TextStyle(fontSize: 14.0, color: AppColors.blackColor),
        )
        .apply(
          fontFamily: AppConstants.englishFont,
        ),
    elevatedButtonTheme: ButtonsTheme.elevatedButtonLightTheme,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith();
}
