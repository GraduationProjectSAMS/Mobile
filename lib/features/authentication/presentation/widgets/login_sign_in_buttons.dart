import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/presentation/manager/login_cubit/login_cubit.dart';

import '../../../../core/utilities/functions/my_toast.dart';
import '../../../../core/utilities/resources/app_strings.dart';
import '../../../../core/utilities/services/cache_service.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../../../../core/widgets/my_button_widget.dart';
import 'google_login_button.dart';

class LoginSignInButtons extends StatelessWidget {
  const LoginSignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<LoginCubit, LoginStates>(
          builder: (context, state) {
            final loginCubit = context.read<LoginCubit>();
            return MyButton(
                isLoading: state is LoginLoading,
                onPressed: loginCubit.loginWithEmailAndPassword,
                text: AppStrings.login);
          },
          listener: (BuildContext context, LoginStates state) {
            if (state is LoginError) {
              showAdaptiveToast(
                  msg: state.error, state: ToastStates.error, context: context);
            } else if (state is LoginSuccess) {
              CacheService.cacheDataThenGoHome(context, state.entity);
            }
          },
        ),
        const HeightSizedBox(height: 2),
        GoogleLoginButton(
          onTap: context.read<LoginCubit>().signInWithGoogle,
          text: AppStrings.signInWithGoogle,
        ),
      ],
    );
  }
}
