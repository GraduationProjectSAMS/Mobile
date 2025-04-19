import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../manager/login_cubit/login_cubit.dart';
import 'login_password_text_form.dart';

class LoginTextFormFields extends StatelessWidget {
  const LoginTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return AutofillGroup(
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            MyTextFormField(
              onSaved: cubit.saveEmail,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              validator: ValidatorService.emailValidator,
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: AppStrings.emailLabelText,
              hintText: AppStrings.emailHintText,
            ),
            const HeightSizedBox(height: 2),
            LoginPasswordTextForm(
              onSaved: cubit.savePassword,
              autofillHints: const [AutofillHints.password],
            ),
          ],
        ),
      ),
    );
  }
}
