import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/login_mobile_design.dart';

import 'authentication_login_banner.dart';

class LoginDiskTopLayOut extends StatelessWidget {
  const LoginDiskTopLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: AuthenticationLoginBanner(),
        ),
        Expanded(child: LoginMobileDesign())
      ],
    );
  }
}
