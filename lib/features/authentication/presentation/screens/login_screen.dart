import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/authentication/presentation/manager/login_cubit/login_cubit.dart';

import '../../domain/use_case/login_with_email_and_password_use_case.dart';
import '../../domain/use_case/send_google_token_to_back_end_use_case.dart';
import '../../domain/use_case/sign_in_with_google_use_case.dart';
import '../widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return BlocProvider(

      create: (context) => LoginCubit(
          getIt.get<LoginWithEmailAndPasswordUseCase>(),
          getIt.get<SignInWithGoogleUseCase>(),
        getIt.get<SendGoogleTokenToBackEndUseCase>(),

      ),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
          // print("mediaWidth: ${MediaQuery.of(context).size.width}");
          //   print("mediaHeight: ${MediaQuery.of(context).size.height}");
          //   print("sizeConfgWidth: ${SizeConfigService.width}");
          //   print("sizeConfgHeight: ${SizeConfigService.height}");

            return  const LoginScreenBody();
          }
        ),
      ),
    );
  }
}
