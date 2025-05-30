import 'package:dio/dio.dart';
import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';

import '../../../../core/utilities/services/api_service.dart';
import 'add_product_remote_repo.dart';

class AddProductRemoteRepoImpl implements AddProductRemoteRepo {
  final ApiService apiService;

  AddProductRemoteRepoImpl(this.apiService);

  @override
  Future<void> addProduct(
      {required Map<String, dynamic> data,
      void Function(int, int)? onSendProgress}) async {
    await apiService.postData(
      onSendProgress: onSendProgress,
      endPoint: AppEndpoints.getProducts,
      formData: FormData.fromMap(data),
    );
  }
}
