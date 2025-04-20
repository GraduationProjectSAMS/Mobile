import 'package:flutter/material.dart';

import '../screens/authentication_adaptive_lay_out.dart';
import 'login_disk_top_lay_out.dart';
import 'login_mobile_design.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  static const space = 2.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AuthenticationAdaptiveLayOut(
        mobileLayOut: (BuildContext context) => const LoginMobileDesign(),
        desktopLayOut: (BuildContext context) => const LoginDiskTopLayOut(),
      ),
    );
  }
}
