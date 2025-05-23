import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';

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

void showAdaptiveToast({
  required BuildContext context,
  required String msg,
  required ToastStates state,
  Toast? toastLength,
}) {
  final duration = toastLength == Toast.LENGTH_LONG
      ? const Duration(seconds: 5)
      : const Duration(seconds: 2);

  if (SizeConfigService.isDesktop) {
    final overlay = Overlay.of(context);
    // build the entry
    final entry = OverlayEntry(
      builder: (ctx) {
        // you can tweak top, width, padding, etc.
        return Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            child: _ToastWidget(
              message: msg,
              backgroundColor: toastColor(state),
            ),
          ),
        );
      },
    );

    // insert it
    overlay.insert(entry);

    // remove after duration
    Future.delayed(duration, entry.remove);
  } else {
    // mobile platforms → use your existing toast
    myToast(msg: msg, state: state, toastLength: toastLength);
  }
}

// a little reusable styled toast widget
class _ToastWidget extends StatelessWidget {
  final String message;
  final Color backgroundColor;

  const _ToastWidget({
    required this.message,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black26,
            ),
          ],
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 13.0.sp,
          ),
        ),
      ),
    );
  }
}
