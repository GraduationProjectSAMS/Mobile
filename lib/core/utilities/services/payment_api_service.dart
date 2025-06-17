import 'package:dio/dio.dart';

import '../resources/app_endpoints.dart';

class PaymentApiService {
  final Dio _dio;

  PaymentApiService(this._dio) {
    _dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    _dio.options.baseUrl = AppEndpoints.paymentBaseUrl;
    _dio.options.receiveTimeout = const Duration(seconds: 25);
    _dio.options.connectTimeout = const Duration(seconds: 25);
  }

  Future<Response> postData({
    required String endPoint,
    Object? formData,
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? data,
    void Function(int, int)? onSendProgress,
  }) async {
    return _dio.post(
      endPoint,
      queryParameters: data,
      data: formData,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }
}
