import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';

import '../../../domain/use_cases/get_order_details_use_case.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit({
    required this.getOrderDetailsUseCase,
  }) : super(OrderDetailsLoading());
  final GetOrderDetailsUseCase getOrderDetailsUseCase;

  Future<void> getOrderDetails(dynamic orderId) async {
    final result = await getOrderDetailsUseCase(orderId: orderId);
    result.fold(
      (failure) {
        emit(OrderDetailsError(failure.errorMessage));
      },
      (orderDetails) {
        emit(OrderDetailsSuccess(orderDetails));
      },
    );
  }
}
