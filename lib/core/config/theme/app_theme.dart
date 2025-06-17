import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/theme/shimmer_theme_data.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';

import '../../utilities/resources/app_colors.dart';
import 'buttons_theme.dart';
import 'my_bottom_navigation_bar_theme.dart';
import 'my_text_form_field_theme.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    extensions: [
      ShimmerThemeData.light,
    ],
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android:
            FadeForwardsPageTransitionsBuilder(backgroundColor: Colors.white),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS:
            FadeForwardsPageTransitionsBuilder(backgroundColor: Colors.white),
        TargetPlatform.windows:
            FadeForwardsPageTransitionsBuilder(backgroundColor: Colors.white),
      },
    ),
    hoverColor: AppColors.primary.withValues(alpha: 0.1),
    splashColor: AppColors.primary.withValues(alpha: 0.1),
    primaryColor: AppColors.primary,
    navigationBarTheme: MyBottomNavigationBarTheme.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    canvasColor: AppColors.white,
    splashFactory: InkSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.offWhite,
    cardTheme: const CardTheme(
      color: AppColors.white,
    ),
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
