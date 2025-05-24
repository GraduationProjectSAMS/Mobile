import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/widgets/my_text_form_field.dart';


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
      if (widget.value != null && widget.value != _controller.text) {
        _controller.text = widget.value!;
      }
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
    return MyTextFormField(
      enableInteractiveSelection: false,
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
      labelText: widget.label,
      suffixIcon: suffixIcon,
      hintText: widget.hint,
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

