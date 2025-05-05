import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:graduation_project/features/favorites/data/models/favorites_model.dart';

import '../../../../core/utilities/services/api_service.dart';
import '../../../home/domain/entities/product_entity.dart';
import 'cards_remote_repo.dart';

class CardsRemoteRepoImpl implements CardsRemoteRepo {
  final ApiService apiService;

  CardsRemoteRepoImpl(this.apiService);

  @override
  Future<void> addToCard(
      {required productId, required String type, int quantity = 1}) async {
    await apiService.postData(
      endPoint: AppEndpoints.addToCart,
      data: {
        'item_id': productId,
        'item_type': type,
        'quantity': quantity,
      },
    );
  }

  @override
  Future<List<ProductEntity>> getCards() async {
    final response = await apiService.getData(
      endPoint: AppEndpoints.addToCart,
    );
    final model = FavoritesModel.fromJson(response?.data);
    final products = model.favoritesData.toEntityList;
    return products;
  }

  @override
  Future<void> removeFromCard(
      {required productId, required String type}) async {
    await apiService.deleteData(
      endPoint: '${AppEndpoints.addToCart}/$type/$productId',
    );
  }

// Implement methods here
}
