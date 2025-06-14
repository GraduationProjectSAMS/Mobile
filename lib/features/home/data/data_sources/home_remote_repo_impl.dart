

import 'package:dio/dio.dart';
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
        await apiService.getData(endPoint: AppEndpoints.getProducts, data: {
      'page': 1,
      'per_page': 1000,
    });
    final model = ProductModel.fromJson(response?.data);
    final productList = model.productData.toEntityList;
    return productList;
  }

  @override
  Future<List<ProductEntity>> getOffers() async {
    final response =
        await apiService.getData(endPoint: AppEndpoints.getOffers, data: {
      'page': 1,
      'paginate': 1000,
    });
    final model = OffersModel.fromJson(response?.data);
    final productList = model.data.toEntityList;
    return productList;
  }

  @override
  Future<void> addOffer(
      {required Map<String, dynamic> offerData,
      void Function(int, int)? onSendProgress}) async {
    await apiService.postData(
      onSendProgress: onSendProgress,
      endPoint: AppEndpoints.getOffers,
      formData: FormData.fromMap(offerData),
    );
  }

  @override
  Future<ProductEntity> getOfferById(int id) async {
    final response = await apiService.getData(
      endPoint: '${AppEndpoints.getOffers}/$id',
    );
    final model = OffersData.fromJson(response?.data['data']);
    return model.toEntity;
  }

  @override
  Future<ProductEntity> getProductById(int id) async {
    final response = await apiService.getData(
      endPoint: '${AppEndpoints.getProducts}/$id',
    );
    final model = ProductData.fromJson(response?.data['data']);
    return model.toEntity;
  }

  @override
  Future<List<ProductEntity>> getProductRecommendations() async {
    final response = await apiService.getData(
      endPoint: AppEndpoints.getRecommendations,
    );
    final list = (response?.data['data'] as List).map(ProductData.fromJson).toList();
    return list.toEntityList;
  }
}
