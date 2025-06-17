import 'package:flutter/cupertino.dart';

import '../utilities/services/size_config_service.dart';

class AppSizConfig extends StatelessWidget {
  const AppSizConfig({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (SizeConfigService.isDesktop) {
      MediaQuery.sizeOf(context);
    }
    SizeConfigService.init(context);
    return child;
  }
}
