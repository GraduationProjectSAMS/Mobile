import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/utilities/services/validator_service.dart';
import '../../../../core/widgets/my_text_form_field.dart';

class LoginPasswordTextForm extends StatefulWidget {
  final bool hidePassword; // Whether the password is hidden
  final Widget? suffixIcon; // Custom suffix icon
  final Widget? prefixIcon; // Custom prefix icon
  final String? hintText; // Hint text for the text field
  final ValueChanged<String?>? onSaved; // Callback for text changes
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;

  const LoginPasswordTextForm({
    super.key,
    this.hidePassword = true, // Default to hiding password
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.onSaved,
    this.autofillHints,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
  });

  @override
  MyTextFormFieldState createState() => MyTextFormFieldState();
}

class MyTextFormFieldState extends State<LoginPasswordTextForm> {
  bool _isPasswordVisible = false; // Internal state for password visibility

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      onSaved: widget.onSaved,
      autofillHints: widget.autofillHints,
      validator: ValidatorService.passwordValidator,
      prefixIcon: const Icon(Icons.lock_outline),
      labelText: AppStrings.passwordLabelText,
      hintText: AppStrings.passwordHintText,
      hidePassword: widget.hidePassword ? !_isPasswordVisible : false,
      //
      suffixIcon: widget.hidePassword
          ? PasswordSuffixIconWidget(
              isShowPassword: _isPasswordVisible,
              onTap: _togglePasswordVisibility,
            )
          : widget.suffixIcon, // Toggle password visibility
    );
  }
}

class PasswordSuffixIconWidget extends StatelessWidget {
  final bool isShowPassword;
  final VoidCallback onTap;

  const PasswordSuffixIconWidget({
    super.key,
    required this.isShowPassword,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
          isShowPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          color: Colors.grey,
          size: 25.sp),
    );
  }
}
