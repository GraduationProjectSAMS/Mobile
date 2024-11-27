import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

class HeightSizedBox extends StatelessWidget {
  const HeightSizedBox({super.key, required this.height, });
  final double height;


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:height.hR,
    );
  }
}