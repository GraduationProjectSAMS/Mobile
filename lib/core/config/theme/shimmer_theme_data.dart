import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShimmerThemeData {
  static var light = SkeletonizerConfigData(
    enableSwitchAnimation: true,
    effect: ShimmerEffect(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
    ),
  );
}
