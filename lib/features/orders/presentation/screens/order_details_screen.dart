import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';

import '../manager/order_details_cubit/order_details_cubit.dart';
import '../widgets/order_details_screen_body.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)?.settings.arguments;
    return BlocProvider(
      create: (context) =>
          OrderDetailsCubit(getOrderDetailsUseCase: getIt.get())
            ..getOrderDetails(orderId),
      child: const Scaffold(body: OrderDetailsScreenBody()),
    );
  }
}
