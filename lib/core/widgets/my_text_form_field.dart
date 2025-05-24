import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

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
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.maxLines=1,
    this.minLines,
    this.suffix,
    this.inputFormatters,
  });

  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
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
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;

  // max min lines
  final int maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      minLines: minLines,
      readOnly: readOnly,
      autofillHints: autofillHints,
      enabled: enabled,
      focusNode: focusNode,
      autofocus: autofocus,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: hidePassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 13.sp
        ),
        label: Text(
          labelText ?? '',
          maxLines: 1,
          style:  TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 13.sp
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix
      ),
    );
  }
}
