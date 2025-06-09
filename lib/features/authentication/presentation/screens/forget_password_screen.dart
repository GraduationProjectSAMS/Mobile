import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';

import '../widgets/forget_password_screen_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
          sendResetPasswordOtpUseCase: getIt.get(),
          resetPasswordUseCase: getIt.get()),
      child: const Scaffold(
        body: ForgetPasswordScreenBody(),
      ),
    );
  }
}
