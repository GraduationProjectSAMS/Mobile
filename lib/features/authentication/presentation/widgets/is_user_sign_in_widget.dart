import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';

import 'package:graduation_project/core/utilities/resources/app_styles.dart';

import '../../../../core/widgets/my_button_widget.dart';

class IsUserSignInWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLogin;

  const IsUserSignInWidget({super.key, required this.isLogin, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getText(),
          style: AppStyles.textStyle15.copyWith(color: AppColors.grey),

        ),
        MyTextButton(onTap: onTap, text: getButtonText())

      ],
    );
  }
  String getText(){
    if(isLogin){
      return AppStrings.haveAccount;
    }else{
      return AppStrings.noAccount;
    }
  }
  String getButtonText(){
    if(isLogin){
      return AppStrings.login;
    }else{
      return AppStrings.signUp;
    }
  }
}