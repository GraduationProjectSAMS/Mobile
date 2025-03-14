import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_button_widget.dart';
import '../../domain/use_case/sign_in_with_google_use_case.dart';
import 'google_login_button.dart';

class LoginSignInButtons extends StatelessWidget {
  const LoginSignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(onPressed: () {}, text: AppStrings.login),
        HeightSizedBox(height: 2),
        GoogleLoginButton(
          onTap: () async {
            await getIt.get<SignInWithGoogleUseCase>().call();
          },
          text: AppStrings.signInWithGoogle,
        ),
      ],
    );
  }
}
