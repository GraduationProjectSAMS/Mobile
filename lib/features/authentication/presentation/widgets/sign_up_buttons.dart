import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/functions/my_toast.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';
import 'package:graduation_project/features/authentication/presentation/manager/signup_cubit/signup_cubit.dart';

import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_button_widget.dart';
import 'google_login_button.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<SignupCubit, SignupStates>(
          builder: (context, state) {
            final cubit = context.read<SignupCubit>();
            return MyButton(
                isLoading: state is SignupLoading,
                onPressed: cubit.signup,
                text: AppStrings.signUp);
          },
          listener: (BuildContext context, SignupStates state) {
            if (state is SignupError) {
              myToast(msg: state.error, state: ToastStates.error);
            } else if (state is SignupSuccess) {
              CacheService.saveTokenThenGoHome(context, state.entity);
            }
          },
        ),
        const HeightSizedBox(height: 2),
        GoogleLoginButton(
          onTap: context.read<SignupCubit>().signInWithGoogle,
          text: AppStrings.signUpWithGoogle,
        ),
      ],
    );
  }
}
