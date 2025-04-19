import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/widgets/my_button_widget.dart';
import 'login_check_box.dart';

class LoginRememberMeWithCheckBox extends StatelessWidget {
  const LoginRememberMeWithCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const LoginCheckBox(),
        Text(AppStrings.rememberMe,style: AppStyles.textStyle14,),
        const Spacer(),
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
