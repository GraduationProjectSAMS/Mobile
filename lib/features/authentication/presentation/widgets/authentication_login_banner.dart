import 'package:flutter/material.dart';

import '../../../../core/utilities/resources/app_assets.dart';

class AuthenticationLoginBanner extends StatelessWidget {
  const AuthenticationLoginBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(AppAssets.loginBanner),
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }
}
