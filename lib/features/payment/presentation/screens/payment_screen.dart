import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';

import '../../domain/use_cases/get_pay_mob_client_key_use_case.dart';
import '../widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(getPayMobClientKeyUseCase: getIt.get<GetPayMobClientKeyUseCase>()),
      child: const Scaffold(
        body: PaymentScreenBody(),
      ),
    );
  }
}
