import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/validator_service.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../manager/signup_cubit/signup_cubit.dart';
import 'login_password_text_form.dart';

class SignUpTextForms extends StatefulWidget {
  const SignUpTextForms({super.key});

  @override
  SignUpTextFormsState createState() => SignUpTextFormsState();
}

class SignUpTextFormsState extends State<SignUpTextForms> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return AutofillGroup(

      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            MyTextFormField(
              autofillHints: const [AutofillHints.newUsername],
              keyboardType: TextInputType.name,
              onSaved: cubit.setName,
              prefixIcon: const Icon(Icons.person_outline),
              labelText: AppStrings.nameLabelText,
              hintText: AppStrings.nameHintText,
              validator: ValidatorService.userNameValidator,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                // When user submits the first field, move to the second
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
            ),
            const HeightSizedBox(height: 2),
            MyTextFormField(
              autofillHints: const [AutofillHints.newUsername],
              focusNode: _emailFocusNode,
              // Assign the email focus node
              keyboardType: TextInputType.emailAddress,
              onSaved: cubit.setEmail,
              validator: ValidatorService.emailValidator,
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: AppStrings.emailLabelText,
              hintText: AppStrings.emailHintText,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                // When user submits the second field, move to the third
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
            ),
            const HeightSizedBox(height: 2),
            LoginPasswordTextForm(
              autofillHints: const [AutofillHints.newPassword],
              focusNode: _passwordFocusNode,
              // Assign the password focus node
              onSaved: cubit.setPassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => cubit.signup(),
              // Optionally submit the form here or perform other actions
            ),
          ],
        ),
      ),
    );
  }
}
