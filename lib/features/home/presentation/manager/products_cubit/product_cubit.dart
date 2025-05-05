import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';

import '../../../domain/use_cases/get_products_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(this._getProductsUseCase) : super(ProductLoadingStates());
  final GetProductsUseCase _getProductsUseCase;

  List<ProductEntity> products = [];

  List<ProductEntity> homeProducts = [];

  Future<void> getProducts() async {
    if (state is! ProductLoadingStates) {
      emit(ProductLoadingStates());
    }
    final result = await _getProductsUseCase.call();
    result.fold(
      (failure) => emit(ProductErrorStates(failure.errorMessage)),
      (products) {
        this.products = products;
        homeProducts = products.sublist(
            0, this.products.length > 5 ? 5 : this.products.length);

        emit(ProductSuccessStates(products));
      },
    );
  }

  void viewAllProducts() {
    if (state is ProductSuccessStates) {
      emit(ViewAllProductsStates());
    }
  }
}
