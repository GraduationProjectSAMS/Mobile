import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/authentication/presentation/manager/signup_cubit/signup_cubit.dart';

import '../../domain/use_case/send_google_token_to_back_end_use_case.dart';
import '../../domain/use_case/sign_in_with_google_use_case.dart';
import '../../domain/use_case/signup_with_gmail_use_case.dart';
import '../widgets/signup_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt.get<SignupWithGmailUseCase>(),
        getIt.get<SignInWithGoogleUseCase>(), getIt.get<SendGoogleTokenToBackEndUseCase>(),
      ),
      child: Scaffold(
        body: SignupScreenBody(),
      ),
    );
  }
}
