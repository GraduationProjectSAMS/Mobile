import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/orders/data/models/order_products.dart';
import 'package:graduation_project/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';

import '../widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as ({
      num totalPrice,
      List<OrderProducts> orderProducts,
    });

    return BlocProvider(
      create: (context) => PaymentCubit(
          getCurrentOrderLocationUseCase: getIt.get(),
          orderProducts: arg.orderProducts,
          paymentAmount: arg.totalPrice,
          createOrderUseCase: getIt.get(),
          setOrderLocationUseCase: getIt.get(),
          getPayMobClientKeyUseCase: getIt.get())
        ..getCurrentOrderLocation(),
      child: const Scaffold(
        body: PaymentScreenBody(),
      ),
    );
  }
}
