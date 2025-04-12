import 'package:flutter/cupertino.dart';

abstract class SizeConfigService {
  static double width = 0, height = 0;
  static const maxMobileWidth = 600;

  static void init(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      height = MediaQuery.sizeOf(context).width;
      width = MediaQuery.sizeOf(context).height;
    } else {
      height = MediaQuery.sizeOf(context).height;
      width = MediaQuery.sizeOf(context).width;
    }
  }

  static double getResponsiveFontSize(
    double fontSize,
  ) {
    double scaleFactor = getScaleFactor();
    double responsiveFontSize = fontSize * scaleFactor;
    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.4;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor() {
    if (SizeConfigService.width < SizeConfigService.maxMobileWidth) {
      return SizeConfigService.width / 400;
    } else {
      return SizeConfigService.width / 600;
    }
  }

  static int setListCount(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    if (width < 600) {
      return 2;
    } else if (width < 1000) {
      return 3;
    } else {
      return 4;
    }
  }
}
