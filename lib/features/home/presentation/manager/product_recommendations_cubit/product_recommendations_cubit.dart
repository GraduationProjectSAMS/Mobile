import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../domain/use_cases/get_product_recommendations_use_case.dart';

part 'product_recommendations_state.dart';

class ProductRecommendationsCubit extends Cubit<ProductRecommendationsState> {
  ProductRecommendationsCubit(
      {required GetProductRecommendationsUseCase
          getProductRecommendationsUseCase})
      : _getProductRecommendationsUseCase = getProductRecommendationsUseCase,
        super(ProductRecommendationsInitial());
  final GetProductRecommendationsUseCase _getProductRecommendationsUseCase;

  Future<void> getProductRecommendations() async {
    emit(ProductRecommendationsLoading());
    final result = await _getProductRecommendationsUseCase.call();
    result.fold(
      (failure) => emit(ProductRecommendationsError(failure.errorMessage)),
      (recommendations) => emit(ProductRecommendationsSuccess(recommendations)),
    );
  }
}
