import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/widgets/height_sized_box.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/sign_up_buttons.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/sign_up_text_forms.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/welcome_text.dart';

import 'is_user_sign_in_widget.dart';

class SignupMobileLayout extends StatelessWidget {
  const SignupMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // User Name Field
              const WelcomeText(
                  text1: AppStrings.registerAccount,
                  text2: AppStrings.signUpMassage),

              const HeightSizedBox(height: 6),
              const SignUpTextForms(),
              const HeightSizedBox(
                height: 2,
              ),
              const SignUpButtons(),
              const HeightSizedBox(height: 1.5),
              IsUserSignInWidget(
                  isLogin: true,
                  onTap: () {
                    context.pop();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
