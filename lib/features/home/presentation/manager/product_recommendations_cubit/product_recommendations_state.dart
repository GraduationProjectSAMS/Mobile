part of 'product_recommendations_cubit.dart';

@immutable
sealed class ProductRecommendationsState {}

final class ProductRecommendationsInitial extends ProductRecommendationsState {}

final class ProductRecommendationsLoading extends ProductRecommendationsState {}

final class ProductRecommendationsSuccess extends ProductRecommendationsState {
  final List<ProductEntity> recommendations;

  ProductRecommendationsSuccess(this.recommendations);
}

final class ProductRecommendationsError extends ProductRecommendationsState {
  final String mess;

  ProductRecommendationsError(this.mess);
}
