

import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';


class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          textAlign:TextAlign.center ,
          text1,style: AppStyles.textStyle20,),
        SizedBox(height: 2,),
        Text(
            textAlign:TextAlign.center ,
            text2,style: AppStyles.textStyle15.copyWith(color:AppColors.grey)),
      ],
    );
  }
}