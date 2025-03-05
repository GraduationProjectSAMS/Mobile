import 'package:flutter/material.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/widgets/my_button_widget.dart';
import 'login_check_box.dart';

class LoginRememberMeWithCheckBox extends StatelessWidget {
  const LoginRememberMeWithCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        LoginCheckBox(),
        Text(AppStrings.rememberMe),
        Spacer(),
        MyTextButton(
          onTap: () {
            // Handle forgot password
          },
          text: AppStrings.forgotPassword,
        ),
      ],
    );
  }
}
