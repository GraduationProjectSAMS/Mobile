import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/functions/list_methods.dart';
import 'package:graduation_project/core/widgets/app_api_error_widget.dart';
import 'package:graduation_project/features/orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:graduation_project/features/orders/presentation/widgets/empty_order_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entities/order_entity.dart';
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

        return buildListOrEmptyItem<OrderEntity>(
          list: cubit.orders,
          isLoading: isLoading,
          listEmptyWidget: EmptyOrderWidget.new,
          listWidget: (List<OrderEntity> list, bool isLoading) => Skeletonizer(
            enabled: isLoading,
            child: OrdersList(ordersList: list),
          ),
        );
      },
    );
  }
}
