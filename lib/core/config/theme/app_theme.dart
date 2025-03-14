import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';

import '../../utilities/resources/app_colors.dart';
import 'buttons_theme.dart';
import 'my_text_form_field_theme.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    splashColor: AppColors.white,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    splashFactory: InkSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: ThemeData.light()
        .textTheme
        .copyWith(
          headlineSmall: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: AppColors.black),
          bodyLarge: const TextStyle(fontSize: 14.0, color: AppColors.black),
        )
        .apply(
          fontFamily: AppConstants.englishFont,
        ),
    inputDecorationTheme: TextFormTheme.inputDecorationLightTheme,
    elevatedButtonTheme: ButtonsTheme.elevatedButtonLightTheme,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith();
}
