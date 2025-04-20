import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/screens/authentication_adaptive_lay_out.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/signup_disk_top_layout.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/signup_mobile_layout.dart';

class SignupScreenBody extends StatelessWidget {
  const SignupScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AuthenticationAdaptiveLayOut(
      mobileLayOut: (BuildContext context) => const SignupMobileLayout(),
      desktopLayOut: (BuildContext context) => const SignupDiskTopLayout(),
    ));
  }
}
