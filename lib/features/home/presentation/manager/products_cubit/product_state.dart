part of 'product_cubit.dart';

@immutable
sealed class ProductStates {}

final class ProductLoadingStates extends ProductStates {}

final class ProductSuccessStates extends ProductStates {
  final List<ProductEntity> products;

  ProductSuccessStates(this.products);
}

final class ProductErrorStates extends ProductStates {
  final String errorMessage;

  ProductErrorStates(this.errorMessage);
}
