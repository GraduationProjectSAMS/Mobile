import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/functions/my_toast.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';
import 'package:graduation_project/core/utilities/services/validator_service.dart';
import 'package:graduation_project/core/widgets/my_app_bar.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';
import 'package:graduation_project/core/widgets/my_text_form_field.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../manager/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const MyAppBar(title: 'Forget Password'),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Please enter your email address to reset your password.',
                        style: AppStyles.textStyle15
                            .copyWith(color: AppColors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: cubit.emilFormKey,
                        child: MyTextFormField(
                          onSaved: cubit.setEmail,
                          labelText: 'Email Address',
                          hintText: 'Enter your email address',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                          ),
                          validator: ValidatorService.emailValidator,
                        ),
                      ),
                      const SizedBox(height: 20),
                      BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                        listener: (context, state) {
                          switch (state) {
                            case ForgetPasswordGetTokenSuccess():
                              final cubit = context.read<ForgetPasswordCubit>();
                              context.navigateTo(
                                  pageName: AppRoutes.forgetPasswordOtp,
                                  arguments: cubit);
                            case ForgetPasswordErrorState():
                              showAdaptiveToast(
                                  context: context,
                                  msg: state.errorMessage,
                                  state: ToastStates.error);
                            case ForgetPasswordResetSuccess():
                              CacheService.cacheDataThenGoHome(
                                  context, state.entity);
                            default:
                              break;
                          }
                        },
                        builder: (context, state) {
                          final cubit = context.read<ForgetPasswordCubit>();
                          return MyButton(
                              isLoading: state is ForgetPasswordLoading,
                              onPressed: cubit.onTapSendOtp,
                              text: 'Send');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
