import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:graduation_project/core/utilities/services/payment_api_service.dart';
import 'package:graduation_project/features/payment/data/models/pay_mob_request_model.dart';

import '../../domain/entities/pay_mob_entity.dart';
import '../models/pay_mob_model.dart';
import 'payment_remote_repo.dart';

class PaymentRemoteRepoImpl implements PaymentRemoteRepo {
  final PaymentApiService apiService;

  PaymentRemoteRepoImpl(this.apiService);

  @override
  Future<PayMobEntity> getPayMobSecretKey(
      {required PayMobRequestModel payMobRequestModel}) async {
    final response = await apiService.postData(
      endPoint: AppEndpoints.clientSecretKey,
      formData: json.encode(payMobRequestModel),
      options: Options(
        headers: {'Authorization': 'Bearer ${AppEndpoints.payMobSecretKey}'},
      ),
    );
    final mode = PayMobModel.fromJson(response.data);
    final entity = mode.toEntity;
    return entity;
  }

// Implement methods here
}
