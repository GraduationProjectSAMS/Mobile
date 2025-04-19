import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';
import '../../../../core/widgets/my_text_form_field.dart';

void showChangePasswordDialog(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hideOld = true;
  bool hideNew = true;
  bool hideConfirm = true;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(

          title: const Center(child: Text('Change Password', style: TextStyle(fontSize: 20))),
          content: SingleChildScrollView(
            child: SizedBox(
              width: 100.wR,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTextFormField(
                      hintText: 'Old Password',
                      controller: oldPasswordController,
                      hidePassword: hideOld,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(!hideOld ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => setState(() => hideOld = !hideOld),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter old password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    MyTextFormField(
                      hintText: 'New Password',
                      controller: newPasswordController,
                      hidePassword: hideNew,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(!hideNew ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => setState(() => hideNew = !hideNew),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter new password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    MyTextFormField(
                      hintText: 'Confirm New Password',
                      controller: confirmPasswordController,
                      hidePassword: hideConfirm,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(!hideConfirm ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => setState(() => hideConfirm = !hideConfirm),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm your new password';
                        }
                        if (value != newPasswordController.text) {
                          return 'Passwords do not match';
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
              label: 'Change',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Proceed with password change logic

                  Navigator.of(context).pop(); // Close dialog
                }
              },
            ),
            Center(
              child: TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      );
    },
  );
}
