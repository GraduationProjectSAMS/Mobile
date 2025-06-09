import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/my_app_bar.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';
import 'package:graduation_project/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import 'login_password_text_form.dart';
import 'otpinput.dart';

class ForgetPasswordOtpScreenBody extends StatelessWidget {
  const ForgetPasswordOtpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const MyAppBar(title: 'Forget Password '),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.otpFormKey,
                  child: Column(
                    children: [
                      Text(
                        'Please enter the OTP sent to your email address to reset your password.',
                        style: AppStyles.textStyle15
                            .copyWith(color: AppColors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      OTPInput(
                        onCompleted: cubit.setOtp,
                      ),
                      const SizedBox(height: 20),

                      LoginPasswordTextForm(
                        hintText: 'Enter your new password',
                        labelText: 'New Password',
                        onSaved: cubit.setNewPassword,
                      ),
                      const SizedBox(height: 40),
                      BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                        builder: (context, state) {
                          return MyButton(
                              isLoading: state is ForgetPasswordLoading,
                              onPressed: cubit.onTapResetPassword,
                              text: 'Reset Password');
                        },
                      )

                      // Add your OTP input field here
                      // MyTextFormField for OTP input
                      // MyButton for submitting the OTP
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
