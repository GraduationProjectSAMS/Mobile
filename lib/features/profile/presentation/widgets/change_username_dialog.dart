import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';
import '../../../../core/widgets/my_text_form_field.dart';

void changeUserNameDialog(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();

  bool hideOld = true;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(

          title: Center(child: const Text("Change Username", style: TextStyle(fontSize: 20))),
          content: SingleChildScrollView(
            child: SizedBox(
              width: 100.wR,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTextFormField(
                      hintText: "Username",
                      controller: oldPasswordController,
                      hidePassword: hideOld,
                      prefixIcon: const Icon(Icons.person),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Username";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            ButtonWidget(
              height: 38,
              label: "Change",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Proceed with password change logic

                  Navigator.of(context).pop(); // Close dialog
                }
              },
            ),
            Center(
              child: TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      );
    },
  );
}
