import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

abstract class TextFormTheme {
  static  double get fontSize => 14.sp;
  static InputDecorationTheme inputDecorationLightTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIconColor: AppColors.grey,
    prefixIconColor: AppColors.grey,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
vertical: 5,
      horizontal: 10,
    ),
    fillColor: AppColors.white,
    hintStyle: TextStyle(fontSize: fontSize),
    labelStyle: AppStyles.textStyle15.copyWith(color: AppColors.black),
    disabledBorder: TextFormTheme.setOutlineInputBorder(color: AppColors.grey),
    enabledBorder: TextFormTheme.setOutlineInputBorder(color: AppColors.grey),
    focusedBorder:
        TextFormTheme.setOutlineInputBorder(color: AppColors.primary, width: 2),
    errorBorder: TextFormTheme.setOutlineInputBorder(
      color: AppColors.red,
    ),
    focusedErrorBorder:
        TextFormTheme.setOutlineInputBorder(color: AppColors.red, width: 2),
    errorStyle:
        AppStyles.textStyle15.copyWith(color: AppColors.red, fontSize: 12.5.sp),
  );

  static OutlineInputBorder setOutlineInputBorder(
          {required Color color, double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.kFormRadius),
        borderSide: BorderSide(
          color: color,
          width: width,
        ),
      );
}
