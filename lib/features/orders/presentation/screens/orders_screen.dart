import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/orders/data/repositories/orders_repo_impl.dart';
import 'package:graduation_project/features/orders/domain/use_cases/change_order_status_use_case.dart';
import 'package:graduation_project/features/orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';

import '../widgets/orders_screen_body.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOrdersCubit(
          getOrdersUseCase: getIt.get(),
          changeOrderStatusUseCase:
              ChangeOrderStatusUseCase(getIt.get<OrdersRepoImpl>()))
        ..getOrders(),
      child: const Scaffold(
        body: OrdersScreenBody(),
      ),
    );
  }
}
