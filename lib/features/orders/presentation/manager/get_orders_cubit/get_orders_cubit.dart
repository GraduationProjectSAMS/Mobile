import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/orders/domain/use_cases/change_order_status_use_case.dart';
import 'package:graduation_project/features/orders/domain/use_cases/get_orders_use_case.dart';
import '../../../domain/entities/order_entity.dart';
part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersStates> {
  GetOrdersCubit({
    required GetOrdersUseCase getOrdersUseCase,
    required ChangeOrderStatusUseCase changeOrderStatusUseCase,
  })  : _getOrdersUseCase = getOrdersUseCase,
        _changeOrderStatusUseCase = changeOrderStatusUseCase,
        super(GetOrdersLoading());

  final GetOrdersUseCase _getOrdersUseCase;
  final ChangeOrderStatusUseCase _changeOrderStatusUseCase;

  // Store orders as a class variable
  List<OrderEntity> orders = ordersWaiting ;

  Future<void> getOrders() async {
    orders = ordersWaiting; // Reset orders to initial state
    emit(GetOrdersLoading());
    final result = await _getOrdersUseCase();
    result.fold(
          (failure) => emit(GetOrdersError(failure.errorMessage)),
          (fetchedOrders) {
        orders = fetchedOrders; // Update the orders list
        emit(GetOrdersSuccess()); // Emit success without orders
      },
    );
  }

  Future<void> changeOrderStatus({
    required String orderId,
    required String status,
  required BuildContext context,
  }) async {
    emit(ChangeOrderStatusLoading());
    final result = await _changeOrderStatusUseCase.call(
      orderId: orderId,
      status: status,
    );
    result.fold(
          (failure) => emit(ChangeOrderStatusError(failure.errorMessage)),
          (_) {
        emit(ChangeOrderStatusSuccess());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Order status updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
     getOrders();
          },
    );
  }
}