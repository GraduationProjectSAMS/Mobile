import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

abstract class TextFormTheme {
  static InputDecorationTheme inputDecorationLightTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIconColor: AppColors.grey,
    prefixIconColor: AppColors.grey,
    hintStyle: TextStyle(fontSize: 13.sp),
    labelStyle: AppStyles.textStyle14.copyWith(color: AppColors.black),
    disabledBorder: TextFormTheme.setOutlineInputBorder(color: AppColors.black),
    enabledBorder: TextFormTheme.setOutlineInputBorder(color: AppColors.black),
    focusedBorder: TextFormTheme.setOutlineInputBorder(
        color: AppColors.primaryColor, width: 2),
    errorBorder: TextFormTheme.setOutlineInputBorder(
      color: AppColors.red,
    ),
    focusedErrorBorder:
        TextFormTheme.setOutlineInputBorder(color: AppColors.red, width: 2),
    errorStyle: AppStyles.textStyle15.copyWith(color: AppColors.red, fontSize: 12.sp),
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
