import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

import '../utilities/resources/icon_broken.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.height,
    this.width,
    this.color,
  });

  final bool isLoading;
  final VoidCallback onPressed;
  final String text;
  final double? height;
  final double? width;
  final Color? color;

  Widget get loading => const SizedBox(
    height: 20,
    width: 20,
    child: Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.white,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
      ),
    ),
  );

  Widget get textWidget => Text(
    text,
    style: AppStyles.textStyle18,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Set custom background color if provided
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: isLoading ? loading : textWidget,
      ),
    );
  }
}


class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: AppStyles.textStyle12.copyWith(color: AppColors.primary),
        ));
  }
}

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.isExitButton,
  });

  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final bool? isExitButton;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const CircleBorder(),
      elevation: 3,
      child: GestureDetector(
        onTap: onTap ??
            () {
              Feedback.forTap(context);
              context.pop();
            },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              width: height ?? 38.sp,
              height: width ?? 38.sp,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withValues(alpha: 0.6),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                IconBroken.Arrow___Left_2,
                size: 25.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
    this.labelFontSize,
    this.isLoading = false,
    this.isShowArrow = false,
    this.isTextFitted = false,
    this.width,
    this.height,
    this.color,
    this.labelColor,
    this.icon,
    this.borderRadius,
  });

  final VoidCallback onPressed;
  final String label;
  final double? labelFontSize;
  final Color? labelColor;
  final bool isLoading;
  final bool isShowArrow;
  final bool isTextFitted;
  final double? width;

  final double? height;

  final Color? color;
  final IconData? icon;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 15)),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: isLoading ? () {} : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 15)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
          child: isTextFitted
              ? FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          color: labelColor ?? AppColors.white,
                          fontSize: labelFontSize ?? 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (isShowArrow)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            icon ?? Icons.arrow_forward,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: labelColor ?? AppColors.white,
                        fontSize: labelFontSize ?? 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (isShowArrow)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(
                          icon ?? Icons.arrow_forward,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
