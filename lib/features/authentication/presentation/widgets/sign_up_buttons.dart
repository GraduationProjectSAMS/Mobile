import 'package:flutter/material.dart';

import '../../../../core/utilities/resources/app_strings.dart';

import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_button_widget.dart';
import 'google_login_button.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MyButton(onPressed: () {}, text: AppStrings.signUp),
      HeightSizedBox(height: 2),
      GoogleLoginButton(
        onTap: () {
          // Handle Google sign in
        },
        text: AppStrings.signUpWithGoogle,
      ),
    ],);
  }
}