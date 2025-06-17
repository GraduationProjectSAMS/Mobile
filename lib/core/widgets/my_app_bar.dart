import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

import 'my_button_widget.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title, this.titleStyle});

  final String title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    AppStyles.textStyle20;
    return Row(
      children: [
        const MyBackButton(),
        const Spacer(),
        Text(
          title,
          style: titleStyle ?? AppStyles.textStyle20,
        ),
        const Spacer(),
        const SizedBox(
          width: 40,
        )
      ],
    );
  }
}
