import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/config/routes/app_route.dart';
import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_button_widget.dart';
import 'google_login_button.dart';

class LoginSignInButtons extends StatelessWidget {
  const LoginSignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(onPressed: () {
          context.navigateAndRemoveUntil(pageName: AppRoutes.homeLayout);
        }, text: AppStrings.login),
        HeightSizedBox(height: 2),
        GoogleLoginButton(
          onTap: () async {

          },
          text: AppStrings.signInWithGoogle,
        ),
      ],
    );
  }
}
