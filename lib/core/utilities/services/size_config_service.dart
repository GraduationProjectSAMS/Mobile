import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class SizeConfigService with WidgetsBindingObserver  {
  static double  width = 0, height = 0;
  static const maxMobileWidth = 550;
  static const maxTabletWidth = 1000;
static bool isDesktop = Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  static void init(BuildContext context) {
    final  orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape && !isDesktop) {
      height = MediaQuery.sizeOf(context).width;
      width = MediaQuery.sizeOf(context).height;
    } else {
      height = MediaQuery.sizeOf(context).height;
      width = MediaQuery.sizeOf(context).width;
      if (isDesktop) {
        _rebuildTree(context as Element);
      }
     }
  }

  static double getResponsiveFontSize(
    double fontSize,
  ) {
    final double scaleFactor = getScaleFactor();
    final double responsiveFontSize = fontSize * scaleFactor;
    final double lowerLimit = fontSize * 0.7;
    final double upperLimit = fontSize * 1.5;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }
 static void _rebuildTree(Element root) {
    root.markNeedsBuild();
    root.visitChildren(_rebuildTree);
  }
  static double getScaleFactor() {

    if (SizeConfigService.width < SizeConfigService.maxMobileWidth) {

      return SizeConfigService.width / 400;
    }else if (SizeConfigService.width < SizeConfigService.maxTabletWidth) {

      return SizeConfigService.width / 800;
    }

    else {

      return SizeConfigService.width / 1200;
    }
  }
// static double getResponsiveHeight(double height) {
//     final double scaleFactor = getScaleFactor();
//     final double responsiveHeight = height * scaleFactor;
//     final double lowerLimit = height * 0.7;
//     final double upperLimit = height * 1.5;
//
//     return responsiveHeight.clamp(lowerLimit, upperLimit);
//   }
//   static double getResponsiveWidth(double width) {
//     final double scaleFactor = getScaleFactor();
//     final double responsiveWidth = width * scaleFactor;
//     final double lowerLimit = width * 0.7;
//     final double upperLimit = width * 1.5;
//
//     return responsiveWidth.clamp(lowerLimit, upperLimit);
//   }
  static int setListCount(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    if (width < 600) {
      return 2;
    } else if (width < 1000) {
      return 3;
    } if (width < 1200) {
      return 4;
    }
    else {
      return 5;
    }
  }
}
