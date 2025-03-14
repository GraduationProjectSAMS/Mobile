import 'package:flutter/material.dart';

class LoginCheckBox extends StatefulWidget {
  final bool isActive;
  final ValueChanged<bool>? onChanged;

  const LoginCheckBox({
    super.key,
    this.isActive = true,
    this.onChanged,
  });

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<LoginCheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isActive; // Initialize with the default value
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox.adaptive(
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value ?? false; // Update the state
        });
        if (widget.onChanged != null) {
          widget.onChanged!(_isChecked); // Notify the parent widget
        }
      },
    );
  }
}
