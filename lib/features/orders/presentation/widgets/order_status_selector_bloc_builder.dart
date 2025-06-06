import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';


import 'order_status_selector.dart';

class OrderStatusSelectorBlocBuilder extends StatelessWidget {
  const OrderStatusSelectorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetOrdersCubit>(context);
    return  OrderStatusSelector(
        initialStatus: cubit.selectedStatus,
        onStatusSelected: cubit.onChangeOrderStatus
    );
  }
}
