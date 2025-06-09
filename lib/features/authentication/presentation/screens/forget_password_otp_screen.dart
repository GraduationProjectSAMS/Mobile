import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';

import '../widgets/forget_password_otp_screen_body.dart';

class ForgetPasswordOtpScreen extends StatelessWidget {
  const ForgetPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit =
        ModalRoute.of(context)?.settings.arguments as ForgetPasswordCubit;

    return BlocProvider.value(
      value: cubit,
      child: const Scaffold(
        body: ForgetPasswordOtpScreenBody(),
      ),
    );
  }
}
