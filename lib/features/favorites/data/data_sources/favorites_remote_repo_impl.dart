import '../../../../core/utilities/resources/app_endpoints.dart';
import '../../../../core/utilities/services/api_service.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../models/favorites_model.dart';
import 'favorites_remote_repo.dart';

class FavoritesRemoteRepoImpl implements FavoritesRemoteRepo {
  final ApiService apiService;

  FavoritesRemoteRepoImpl(this.apiService);

  @override
  Future<void> addToFavorite({required productId, required String type}) async {
    await apiService.postData(
      endPoint: '${AppEndpoints.addToFavorite}/$type/$productId',
    );
  }

  @override
  Future<List<ProductEntity>> getFavorites() async {
    final response =
        await apiService.getData(endPoint: AppEndpoints.addToFavorite);
    final model = FavoritesModel.fromJson(response?.data);
    final productList = model.favoritesData.toEntityList;
    return productList;
  }
}
