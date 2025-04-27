import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';


class AppAdaptiveLayOut extends StatelessWidget {
  const AppAdaptiveLayOut(
      {super.key, required this.mobileLayOut, required this.desktopLayOut});

  final WidgetBuilder mobileLayOut, desktopLayOut;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < SizeConfigService.maxMobileWidth )  {
        return mobileLayOut(context);
      }  else {
        return desktopLayOut(context);
      }
    });
  }
}