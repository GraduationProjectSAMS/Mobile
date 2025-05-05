import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/profile/presentation/manager/logout_cubit/logout_cubit.dart';

import '../../domain/use_cases/logout_use_case.dart';
import '../widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(
        logoutUseCase: getIt.get<LogoutUseCase>(),
      ),
      child: const Scaffold(
        body: ProfileScreenBody(),
      ),
    );
  }
}
