import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class SizeConfigService {
  static double width = 0, height = 0;
  static const maxMobileWidth = 550;
  static const maxTabletWidth = 1000;
  static bool isDesktop =
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final newHeight = size.height;
    final newWidth = size.width;
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    // Store previous dimensions to detect changes
    // Detect media query changes
    // Update dimensions based on orientation
    if (isLandscape && !isDesktop) {
      height = newWidth;
      width = newHeight;
    } else {
      height = newHeight;
      width = newWidth;
    }
    // Call rebuild tree on media query change
    _rebuildTree(context as Element);
    // Update previous dimensions
  }

  static double getResponsiveFontSize(
    double fontSize,
  ) {
    final double scaleFactor = getScaleFactor();
    final double responsiveFontSize = fontSize * scaleFactor;
    final double lowerLimit = fontSize * 0.7;
    final double upperLimit = fontSize * 1.4;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static void _rebuildTree(Element root) {
    root.markNeedsBuild();
    root.visitChildren(_rebuildTree);
  }

  static double getScaleFactor() {
    if (SizeConfigService.width < SizeConfigService.maxMobileWidth) {
      return SizeConfigService.width / 400;
    } else if (SizeConfigService.width < SizeConfigService.maxTabletWidth) {
      return SizeConfigService.width / 800;
    } else {
      return SizeConfigService.width / 1400;
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
  static int setGridCountWithContext(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return setGridCountWithWidth(width);
  }

  static int setGridCountWithWidth(num width) {
    if (width < 600) {
      return 2;
    } else if (width < 1000) {
      return 3;
    }
    if (width < 1300) {
      return 4;
    } else {
      return 5;
    }
  }
}
