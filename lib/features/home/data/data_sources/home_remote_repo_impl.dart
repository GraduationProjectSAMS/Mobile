import 'package:graduation_project/features/home/data/models/offers_model.dart';
import 'package:graduation_project/features/home/data/models/product_model.dart';

import '../../../../core/utilities/resources/app_endpoints.dart';
import '../../../../core/utilities/services/api_service.dart';
import '../../domain/entities/product_entity.dart';
import 'home_remote_repo.dart';

class HomeRemoteRepoImpl implements HomeRemoteRepo {
  final ApiService apiService;

  HomeRemoteRepoImpl(this.apiService);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response =
        await apiService.getData(endPoint: AppEndpoints.getProducts);
    final model = ProductModel.fromJson(response?.data);
    final productList = model.productData.toEntityList;
    return productList;
  }

  @override
  Future<List<ProductEntity>> getOffers() async {
    final response = await apiService.getData(endPoint: AppEndpoints.getOffers);
    final model = OffersModel.fromJson(response?.data);
    final productList = model.data.toEntityList;
    return productList;
  }

// Implement methods here
}
