import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/authentication_login_banner.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/signup_mobile_layout.dart';

class SignupDiskTopLayout extends StatelessWidget {
  const SignupDiskTopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: AuthenticationLoginBanner(), // Replace with your actual widget
        ),
        Expanded(child: SignupMobileLayout()),
        // Replace with your actual widget
      ],
    );
  }
}
