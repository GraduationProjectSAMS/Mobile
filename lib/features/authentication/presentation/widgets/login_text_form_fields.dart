import 'package:flutter/material.dart';
import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import 'login_password_text_form.dart';

class LoginTextFormFields extends StatelessWidget {
  const LoginTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        children: [
          MyTextFormField(
            autofillHints: const [AutofillHints.email],
            validator: ValidatorService.emailValidator,
            autofocus: true,
            prefixIcon: Icon(Icons.email_outlined),
            labelText: AppStrings.emailLabelText,
            hintText: AppStrings.emailHintText,
          ),
          HeightSizedBox(height: 2),
          LoginPasswordTextForm(autofillHints: [AutofillHints.password],),
        ],
      ),
    );
  }
}
