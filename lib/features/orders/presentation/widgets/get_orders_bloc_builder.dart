import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/app_api_error_widget.dart';
import 'package:graduation_project/features/orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'orders_list.dart';

class GetOrdersBlocBuilder extends StatelessWidget {
  const GetOrdersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersStates>(
      builder: (context, state) {
        final cubit = context.read<GetOrdersCubit>();
        final isLoading = state is GetOrdersLoading;

        if (state is GetOrdersError) {
          return AppApiErrorWidget(errorMessage: state.error);
        }

        return Skeletonizer(
          enabled: isLoading,
          child: OrdersList(ordersList: cubit.orders),
        );
      },
    );
  }
}