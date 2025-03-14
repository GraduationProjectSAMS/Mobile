import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/services/validator_service.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import 'login_password_text_form.dart';

class SignUpTextForms extends StatelessWidget {
  const SignUpTextForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextFormField(
          validator: ValidatorService.userNameValidator,
          prefixIcon: Icon(Icons.person_outline),
          labelText: AppStrings.nameLabelText,
          hintText: AppStrings.nameHintText,
        ),
        HeightSizedBox(height: 2),
        MyTextFormField(
          validator: ValidatorService.emailValidator,
          prefixIcon: Icon(Icons.email_outlined),
          labelText: AppStrings.emailLabelText,
          hintText: AppStrings.emailHintText,
        ),
        SignUpTextForms(),
        HeightSizedBox(height: 2),
        LoginPasswordTextForm(),
      ],
    );
  }
}
