import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/widgets/height_sized_box.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/sign_up_buttons.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/sign_up_text_forms.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/welcome_text.dart';

import 'is_user_sign_in_widget.dart';

class SignupScreenBody extends StatelessWidget {
  const SignupScreenBody({super.key});

  static const space = 2.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Name Field
              WelcomeText(
                  text1: AppStrings.registerAccount,
                  text2: AppStrings.signUpMassage),

              HeightSizedBox(height: 6),
              SignUpTextForms(),
              HeightSizedBox(
                height: space,
              ),
              SignUpButtons(),
              HeightSizedBox(height: 1.5),
              IsUserSignInWidget(
                  isLogin: true,
                  onTap: () {
                    context.pop();
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
