import 'package:flutter/material.dart';

import '../../../../core/utilities/resources/app_styles.dart';

class HomeTextTitle extends StatelessWidget {
  const HomeTextTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 22,top: 5,bottom: 5),
      child: Text(title,style: AppStyles.textStyle20,),
    );
  }
}