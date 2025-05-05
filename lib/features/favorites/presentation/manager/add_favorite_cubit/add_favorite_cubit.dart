import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/functions/my_toast.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:logger/logger.dart';

import '../../../../favorites/domain/use_cases/get_favorites_use_case.dart';
import '../../../domain/use_cases/add_to_favorites_use_case.dart';

part 'add_favorite_states.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteStates> {
  AddFavoriteCubit({
    required AddToFavoritesUseCase addToFavoritesUseCase,
    required GetFavoritesUseCase getFavoritesUseCase,
  })  : _addToFavoritesUseCase = addToFavoritesUseCase,
        _getFavoritesUseCase = getFavoritesUseCase,
        super(AddFavoriteInitial());
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final GetFavoritesUseCase _getFavoritesUseCase;
  Map<String, bool> productsKeys = {};
  Map<String, ProductEntity> selectedProducts = {};

  Future<void> getFavorites() async {
    if (selectedProducts.isEmpty) emit(AddFavoriteLoading());

    final result = await _getFavoritesUseCase.call();
    result.fold((failure) {
      emit(GetFavoritesErrorState(failure.errorMessage));
    }, (products) {
      selectedProducts = {
        for (var product in products) '${product.id}${product.type}': product
      };
      emit(AddFavoriteSuccess());
    });
  }

  Future<void> toggleFavoriteBackEnd(ProductEntity product) async {
    final productId = product.id;
    final type = product.type;
    toggleFavoriteUI(product);
    emit(AddFavoriteLoading());
    final result =
        await _addToFavoritesUseCase.call(productId: productId, type: type);
    result.fold((failure) {
      toggleFavoriteUI(product);

      myToast(msg: failure.errorMessage, state: ToastStates.error);
      emit(AddFavoriteError(failure.errorMessage));
    }, (_) {
      Logger().i('success');
    });
  }

  void toggleFavoriteUI(ProductEntity product) {
    final productId = product.id;
    final type = product.type;
    productsKeys['$productId$type'] =
        !(productsKeys['$productId$type'] ?? false);
    if (selectedProducts.containsKey('$productId$type')) {
      selectedProducts.remove('$productId$type');
    } else {
      selectedProducts['$productId$type'] = product;
    }
  }

  int get favoritesCount {
    return selectedProducts.length;
  }
}
