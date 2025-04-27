import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../manager/login_cubit/login_cubit.dart';
import 'login_password_text_form.dart';

class LoginTextFormFields extends StatefulWidget {
  const LoginTextFormFields({super.key});

  @override
  State<LoginTextFormFields> createState() => _LoginTextFormFieldsState();
}

class _LoginTextFormFieldsState extends State<LoginTextFormFields> {
  late final LoginCubit _cubit;

  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<LoginCubit>();
    _passwordFocusNode = FocusNode();
  }

  @override
  dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: _cubit.formKey,
        child: Column(
          children: [
            MyTextFormField(
              onFieldSubmitted: (_) {
                // When user submits the first field, move to the second
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              onSaved: _cubit.saveEmail,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              validator: ValidatorService.emailValidator,
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: AppStrings.emailLabelText,
              hintText: AppStrings.emailHintText,
            ),
            const HeightSizedBox(height: 2),
            LoginPasswordTextForm(
              focusNode: _passwordFocusNode,
              onFieldSubmitted: (_) => _cubit.loginWithEmailAndPassword(),
              onSaved: _cubit.savePassword,
              autofillHints: const [AutofillHints.password],
            ),
          ],
        ),
      ),
    );
  }
}
