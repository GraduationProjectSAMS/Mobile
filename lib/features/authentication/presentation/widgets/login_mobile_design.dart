import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_assets.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';
import 'package:graduation_project/core/widgets/height_sized_box.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/is_user_sign_in_widget.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/login_remember_me_with_check_box.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/welcome_text.dart';

import '../../../../core/config/routes/app_route.dart';
import 'login_sign_in_buttons.dart';
import 'login_text_form_fields.dart';

class LoginMobileDesign extends StatelessWidget {
  const LoginMobileDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.kPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.appLogo,
                height: 150.sp,
                width: 150.sp,
              ),
              const HeightSizedBox(height: 2),
              const WelcomeText(
                text1: AppStrings.welcomeBack,
                text2: AppStrings.loginMassage,
              ),
              const HeightSizedBox(height: 6),
              const LoginTextFormFields(),
              const HeightSizedBox(height: 1),
              const LoginRememberMeWithCheckBox(),
              const HeightSizedBox(height: 1),
              const LoginSignInButtons(),
              const HeightSizedBox(height: 1.5),
              if (!SizeConfigService.isDesktop)
                IsUserSignInWidget(
                    isLogin: false,
                    onTap: () {
                      context.navigateTo(pageName: AppRoutes.signUpRoute);
                    }),
            ],
          ),
        ),
      ),
    );
  }
}
