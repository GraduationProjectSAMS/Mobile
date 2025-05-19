import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';

import '../../domain/entities/pay_mob_entity.dart';
import '../widgets/pay_mob_card_screen_body.dart';

class PayMobCardScreen extends StatelessWidget {
  const PayMobCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as ({
      PaymentCubit cubit,
      PayMobEntity payMobEntity
    });
    return BlocProvider.value(
      value: arg.cubit,
      child: const Scaffold(
        body: PayMobCardScreenBody(),
      ),
    );
  }
}
