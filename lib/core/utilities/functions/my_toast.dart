import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

void myToast({
  required String? msg,
  required ToastStates state,
  Toast? toastLength,
}) =>
    Fluttertoast.showToast(
      msg: msg!,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 13.0.sp,
    );

enum ToastStates { success, error, warning, normal }

Color toastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.normal:
      color = Colors.grey;
      break;
    case ToastStates.warning:
      color = Colors.amber;
  }
  return color;
}
