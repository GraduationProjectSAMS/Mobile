import 'package:flutter/cupertino.dart';

import '../utilities/services/size_config_service.dart';

class AppSizConfig extends StatelessWidget {
  const AppSizConfig({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {

    if (!SizeConfigService.isDesktop) {
      SizeConfigService.init(context);
      return  child;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfigService.init(context);
        return child;
      },
    );
  }
}
