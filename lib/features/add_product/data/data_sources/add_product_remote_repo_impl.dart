import 'package:dio/dio.dart';
import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';

import 'add_product_remote_repo.dart';
import '../../../../core/utilities/services/api_service.dart';

class AddProductRemoteRepoImpl implements AddProductRemoteRepo {
  final ApiService apiService;

  AddProductRemoteRepoImpl(this.apiService);

  @override
  Future<void> addProduct({required Map<String, dynamic> data}) async {
    await apiService.postData(
      endPoint: AppEndpoints.getProducts,
      formData: FormData.fromMap(data),
    );
  }
}
