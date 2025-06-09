import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.hidePassword = false,
    this.maxLines = 1,
    this.minLines,
    this.style,
    this.hintStyle,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.focusNode,
    this.textInputAction,
    this.autofillHints,
    this.inputFormatters,
    this.onTap,
    this.centerLabel,
    this.contentPadding,
    this.enabled,
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.errorBorder,
    this.fillColor,
    this.isDense,
    this.textAlign = TextAlign.start,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.autofocus = false,
    this.suffix, this.onSaved, this.enableInteractiveSelection,
  });

  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onChanged;
  final bool hidePassword;
  final int maxLines;
  final int? minLines;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final bool? centerLabel;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final Color? fillColor;
  final bool? isDense;
  final AutovalidateMode autoValidateMode;
  final bool autofocus;
  final bool? enableInteractiveSelection;
  final TextAlign textAlign;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: enableInteractiveSelection,
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      enabled: enabled,
      autofocus: autofocus,
      autovalidateMode: autoValidateMode,
      validator: validator,
      obscureText: hidePassword,
      minLines: minLines,
      maxLines: maxLines,
      style: style,
      keyboardType: maxLines>2? TextInputType.multiline: keyboardType,
      focusNode: focusNode,
      textInputAction:  textInputAction,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      textAlign: textAlign,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onSaved: onSaved,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        label: labelText != null
            ? FittedBox(child: Text(labelText!, maxLines: 1))
            : null,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        fillColor: fillColor,

        isDense: isDense,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: (maxLines > 1) ? 10 : 0,
              horizontal: 10,
            ),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        disabledBorder: disabledBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
      ),
    );
  }
}

