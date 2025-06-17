import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repo.dart';

class GetProductRecommendationsUseCase {
  final HomeRepo homeRepo;

  GetProductRecommendationsUseCase(this.homeRepo);

  Future<Either<Failure, List<ProductEntity>>> call() async {
    // Get the original product recommendations
    final result = await homeRepo.getProductRecommendations();

    return result.fold(
      Left.new,
      (products) {
        if (products.isEmpty) return const Right([]);

        // Override compatibility percentages with random numbers
        final updatedProducts = _overrideCompatibilityPercentages(products);

        // Sort by highest compatibility percentage (descending order)
        updatedProducts.sort((a, b) =>
            b.compatibilityPercentage.compareTo(a.compatibilityPercentage));

        return Right(updatedProducts);
      },
    );
  }

  List<ProductEntity> _overrideCompatibilityPercentages(
      List<ProductEntity> products) {
    if (products.isEmpty) return products;

    // Generate random numbers for the products
    final randomPercentages = generateRandomNumbers(products.length);

    // Create new product entities with updated compatibility percentages
    return products.asMap().entries.map((entry) {
      final index = entry.key;
      final product = entry.value;
      // Create a copy of the product with new compatibility percentage
      return product.copyWith(
        compatibilityPercentage: randomPercentages[index].toDouble(),
      );
    }).toList();
  }

  // FIXED VERSION - Allows duplicates to prevent infinite loop

  // ALTERNATIVE: If you want unique numbers with fallback
  List<int> generateRandomNumbers(int count) {
    if (count > 47) {
      return List.generate(count, (index) => index);
    }

    // Create list of all possible values (50-96)
    List<int> allValues = List.generate(47, (index) => index + 50);

    // Shuffle the list
    allValues.shuffle();

    // Return the first 'count' elements
    return allValues.take(count).toList();
  }

// ALTERNATIVE: If you want to expand the range for more unique numbers
}
