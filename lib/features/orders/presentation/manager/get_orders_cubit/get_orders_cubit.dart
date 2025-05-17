import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/order_entity.dart';
import '../../../domain/use_cases/get_orders_use_case.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersStates> {
  GetOrdersCubit({required GetOrdersUseCase getOrdersUseCase})
      : _getOrdersUseCase = getOrdersUseCase,
        super(GetOrdersLoading());
  final GetOrdersUseCase _getOrdersUseCase;

  Future<void> getOrders() async {
    emit(GetOrdersLoading());
    final result = await _getOrdersUseCase();
    result.fold(
      (failure) => emit(GetOrdersError(failure.errorMessage)),
      (orders) => emit(GetOrdersSuccess(orders)),
    );
  }
}
