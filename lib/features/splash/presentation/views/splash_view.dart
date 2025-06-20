import 'package:flutter/material.dart';
import 'package:graduation_project/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF264733), body: SplashViewBody());
  }
}
