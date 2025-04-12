import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_assets.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/widgets/height_sized_box.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/is_user_sign_in_widget.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/login_remember_me_with_check_box.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/welcome_text.dart';

import '../../../../core/config/routes/app_route.dart';
import 'login_sign_in_buttons.dart';
import 'login_text_form_fields.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  static const space = 2.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.kPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.appLogo,
                height: 150.sp,
                width: 150.sp,
              ),
              HeightSizedBox(height: 2),
              WelcomeText(
                text1: AppStrings.welcomeBack,
                text2: AppStrings.loginMassage,
              ),
              HeightSizedBox(height: 6),
              LoginTextFormFields(),
              HeightSizedBox(height: 1),
              LoginRememberMeWithCheckBox(),
              HeightSizedBox(height: 1),
              LoginSignInButtons(),
              HeightSizedBox(height: 1.5),
              IsUserSignInWidget(
                  isLogin: false,
                  onTap: () {
                    context.navigateTo(pageName: AppRoutes.signUpRoute);
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
