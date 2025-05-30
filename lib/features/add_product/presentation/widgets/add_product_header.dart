import 'package:flutter/material.dart';

import '../../../../core/widgets/my_button_widget.dart';

class AddProductHeader extends StatelessWidget {
  const AddProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
      child: Row(
        children: [
          MyBackButton(),
          SizedBox(width: 20),
          Text(
            'Add Product',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
