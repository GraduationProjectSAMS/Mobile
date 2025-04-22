import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/config/extension/extension.dart';


class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({
    super.key,
    this.dropdownWidth,
    required this.dropdownItems,
    this.value,
    required this.onChanged,
    this.validator,
    this.isTextTranslated = false,
    this.enabled = true,
    this.isShowLoading = true,
    this.label,
    this.suffixIcon,
    this.hint,
    this.disabledBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.onChangedIndex,
    this.isDense = false,
    this.contentPadding,
  });

  final double? dropdownWidth;
  final List<String> dropdownItems;
  final bool isTextTranslated;
  final String? value;
  final void Function(String? value) onChanged;
  final void Function(int? value)? onChangedIndex;
  final String? Function(String?)? validator;
  final String? label;
  final String? hint;
  final bool enabled;
  final bool isShowLoading;
  final Widget? suffixIcon;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final AutovalidateMode autoValidateMode;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  late TextEditingController _controller;
  late ScrollController _scrollController;
  final GlobalKey _textFieldKey = GlobalKey();

  void _showPopupMenu(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final RenderBox renderBox =
        _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    // Use custom width if provided, otherwise use the width of the TextFormField
    final double menuWidth = widget.dropdownWidth ?? size.width;
    showMenu(
      context: context,
      popUpAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        reverseDuration: const Duration(milliseconds: 100),
        reverseCurve: Curves.easeInOut,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xFFf3f3f2),
      position:
          !isRtl
              ? RelativeRect.fromLTRB(
                offset.dx,
                offset.dy + size.height,
                offset.dx,
                offset.dy,
              )
              : RelativeRect.fromLTRB(
                offset.dx - (isRtl ? menuWidth - size.width : 0),
                offset.dy + size.height,
                offset.dx + (isRtl ? menuWidth : size.width),
                offset.dy,
              ),

      items: [
        PopupMenuItem<String>(
          value: '',
          enabled: false,
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 30.hR),
            child: Scrollbar(
              thumbVisibility: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    widget.dropdownItems.length,
                    (index) => PopupMenuItem<String>(
                      value: widget.dropdownItems[index],

                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        widget.dropdownItems[index],
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      elevation: 20.0,
      shadowColor: Colors.blueGrey,

      constraints: BoxConstraints(
        minWidth: menuWidth,
        maxWidth: menuWidth,
        maxHeight: 30.hR,
      ),
    ).then((value) {
      if (value != null) {
        _controller.text = value;
        if (widget.onChangedIndex != null) {
          widget.onChangedIndex!(widget.dropdownItems.indexOf(value));
        }

        widget.onChanged(value);
      }
    });
  }

  bool get isLoading {
    return widget.dropdownItems.isEmpty && widget.isShowLoading;
  }

  @override
  void didUpdateWidget(covariant CustomDropDownMenu oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.text = widget.value ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.value != null) {
         _controller.text = widget.value!;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      key: _textFieldKey,
      onTap: () {
        if (!isLoading && widget.enabled) {
          _showPopupMenu(context);
        }
      },
      autoValidateMode: widget.autoValidateMode,
      enabled: widget.enabled,
      controller: _controller,
      readOnly: true,
      validator: widget.validator,
      keyboardType: TextInputType.none,
      label: widget.label,
      suffixIcon: suffixIcon,
      hint: widget.hint,
      disabledBorder: widget.disabledBorder,
      enabledBorder: widget.enabledBorder,
      focusedBorder: widget.focusedBorder,
      isDense: widget.isDense,
      contentPadding: widget.contentPadding,
    );
  }

  Widget get suffixIcon {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    if (widget.suffixIcon == null) {
      return Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Colors.blueGrey.withValues(alpha: 0.6),
        size: 20.sp,
      );
    } else {
      return widget.suffixIcon!;
    }
  }
}

class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onChanged;
  final bool obsceure;
  final int? maxLines;
  final int? minLines;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final bool? readOnly;
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
  final TextAlign formTextAlign;
  final Color? fillColor;
  final bool? isDense;
  final AutovalidateMode autoValidateMode;
  final bool autofocus;

  const MyTextField({
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.obsceure = false,
    this.maxLines,
    this.minLines,
    this.onFieldSubmitted,
    this.onChanged,
    this.keyboardType,
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.initialValue,
    this.style,
    this.hintStyle,
    this.readOnly,
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
    this.formTextAlign = TextAlign.start,
    this.fillColor,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.errorBorder,
    this.isDense,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autofocus: autofocus,
      textAlign: formTextAlign,
      autovalidateMode: autoValidateMode,
      controller: controller,
      focusNode: focusNode,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      validator: validator,
      obscureText: obsceure,
      minLines: minLines,
      initialValue: initialValue,
      onTap: onTap,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      style: style ?? TextStyle(fontSize: 13.sp),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        alignLabelWithHint: centerLabel,
        fillColor: fillColor,
        filled: fillColor != null,
        label:
        label != null ? FittedBox(child: Text(label!, maxLines: 1)) : null,
        suffixIcon: suffixIcon,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        disabledBorder: disabledBorder,
        focusedErrorBorder: errorBorder,
        errorBorder: errorBorder,
        isDense: isDense,

        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(minWidth: 8.wR),
        suffixIconConstraints: BoxConstraints(minWidth: 8.wR),
        contentPadding:
        contentPadding ??
            EdgeInsets.symmetric(
              vertical: (maxLines != null && maxLines! > 1) ? 10 : 0,
              horizontal: 10,
            ),
        hintText: hint,
        hintStyle: hintStyle,
        //hintStyle: hintStyle ?? AppStyle.inputTextStyle,
      ),
    );
  }
}