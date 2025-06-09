import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/utilities/services/validator_service.dart';
import 'package:graduation_project/core/widgets/my_text_form_field.dart';

class OTPInput extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;
  final Function(String)? onChanged;
  final double fieldWidth;
  final double fieldHeight;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final bool obscureText;
  final Color? cursorColor;

  const OTPInput({
    super.key,
    this.length = 6,
    required this.onCompleted,
    this.onChanged,
    this.fieldWidth = 50.0,
    this.fieldHeight = 60.0,
    this.textStyle,
    this.decoration,
    this.obscureText = false,
    this.cursorColor,
  });

  @override
  State<OTPInput> createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(
      widget.length,
      (index) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      // Move to next field
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }

    // Check if all fields are filled
    final String otp = _controllers.map((controller) => controller.text).join();

    if (widget.onChanged != null) {
      widget.onChanged!(otp);
    }

    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
  }

  void _onKeyDown(RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        _focusNodes[index - 1].requestFocus();
        _controllers[index - 1].clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: widget.fieldWidth,
          height: widget.fieldHeight,
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (event) => _onKeyDown(event, index),
            child: MyTextFormField(
              validator: ValidatorService.emptyValidator,
              textAlign: TextAlign.center,
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              hidePassword: widget.obscureText,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) => _onChanged(value ?? '', index),
            ),
          ),
        ),
      ),
    );
  }
}

// Example usage widget
