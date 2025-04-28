import 'package:flutter/material.dart';

import '../../../../core/utilities/services/size_config_service.dart';

class HomeAdaptiveLayOut extends StatelessWidget {
  const HomeAdaptiveLayOut(
      {super.key, required this.mobileLayOut, required this.desktopLayOut});

  final WidgetBuilder mobileLayOut, desktopLayOut;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (!SizeConfigService.isDesktop) {
        return mobileLayOut(context);
      } else {
        return desktopLayOut(context);
      }
    });
  }
}
