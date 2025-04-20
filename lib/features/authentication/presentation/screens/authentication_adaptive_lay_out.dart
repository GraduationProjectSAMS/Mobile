import 'package:flutter/material.dart';

import '../../../../core/utilities/services/size_config_service.dart';

class AuthenticationAdaptiveLayOut extends StatelessWidget {
  const AuthenticationAdaptiveLayOut(
      {super.key, required this.mobileLayOut, required this.desktopLayOut});

  final WidgetBuilder mobileLayOut, desktopLayOut;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < SizeConfigService.maxMobileWidth) {
        return mobileLayOut(context);
      } else if (constraints.maxWidth < SizeConfigService.maxTabletWidth) {
        return mobileLayOut(context);
      } else {
        return desktopLayOut(context);
      }
    });
  }
}
