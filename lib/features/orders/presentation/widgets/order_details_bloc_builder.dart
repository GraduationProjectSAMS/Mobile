import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/app_api_error_widget.dart';
import 'package:graduation_project/features/orders/presentation/manager/order_details_cubit/order_details_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/app_adaptive_lay_out.dart';
import '../../domain/entities/order_entity.dart';
import 'order_details_desktop_design.dart';
import 'order_details_mobile_design.dart';

class OrderDetailsBlocBuilder extends StatelessWidget {
  const OrderDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        final entity =
            state is OrderDetailsSuccess ? state.entity : OrderEntity.loading();

        if (state is OrderDetailsError) {
          return AppApiErrorWidget(
            errorMessage: state.message,
          );
        }
        return Skeletonizer(
            enabled: state is OrderDetailsLoading,
            // Set to true if you want to show loading state
            child: AppAdaptiveLayOut(
              mobileLayOut: (BuildContext context) => OrderDetailsMobileDesign(
                entity: entity,
              ),
              desktopLayOut: (BuildContext context) =>
                  OrderDetailsDesktopDesign(
                entity: entity,
              ),
            ));
      },
    );
  }
}
