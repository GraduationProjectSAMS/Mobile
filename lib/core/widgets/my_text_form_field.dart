import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.hidePassword = false,
    this.onChanged,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixIconOnPressed,
    this.enabled,
    this.readOnly = false,
    this.autofocus = false,
    this.autofillHints,
    this.onSaved,
  });

  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hidePassword;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final VoidCallback? suffixIconOnPressed;
  final bool? enabled;
  final bool readOnly;
  final bool autofocus;
  final Iterable<String>? autofillHints;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      autofillHints: autofillHints,
      enabled: enabled,
      autofocus: autofocus,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: hidePassword,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}
