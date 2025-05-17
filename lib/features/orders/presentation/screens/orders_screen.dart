import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';

import '../widgets/orders_screen_body.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetOrdersCubit(getOrdersUseCase: getIt.get())..getOrders(),
      child: const Scaffold(
        body: OrdersScreenBody(),
      ),
    );
  }
}
