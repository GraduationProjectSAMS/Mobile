import 'package:graduation_project/core/errors/server_failure.dart';
import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:graduation_project/core/utilities/services/api_service.dart';
import 'package:graduation_project/features/authentication/domain/entity/login_entity.dart';
import 'package:logger/logger.dart';

import '../../../../core/utilities/services/google_sign_in_service.dart';
import '../models/login_model.dart';
import 'authentication_remote_repo.dart';

class AuthenticationRemoteRepoImpl implements AuthenticationRemoteRepo {
  final GoogleSignInService _googleSignInService;
  final ApiService _apiService;

  AuthenticationRemoteRepoImpl(this._googleSignInService, this._apiService);

  @override
  Future<String> loginWithGoogle() async {
    final response = await _googleSignInService.signIn();
    final tokenId = response?.accessToken;
    Logger().i('Google Token: $tokenId');
    return tokenId ?? '';
  }

  @override
  Future<LoginEntity> signUp(
      {required String name,
      required String email,
      required String password}) async {
    final response = await _apiService.postData(
      endPoint: AppEndpoints.signUp,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    final model = LoginModel.fromJson(response.data);
    final loginEntity = model.data?.toEntity;

    if (loginEntity != null) return loginEntity;
    throw ServerFailure('Sign up failed');
  }

  @override
  Future<LoginEntity> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    final response = await _apiService.postData(
      endPoint: AppEndpoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    final model = LoginModel.fromJson(response.data);
    final loginEntity = model.data?.toEntity;
    if (loginEntity != null) return loginEntity;
    throw ServerFailure('Login failed');
  }

  @override
  Future<LoginEntity> sendGoogleTokenToBackEnd(
      {required String googleToken}) async {
    final response = await _apiService.postData(
      endPoint: AppEndpoints.loginWithGoogle,
      formData: {
        'access_token': googleToken,
      },
    );

    final model = LoginModel.fromJson(response.data);
    final loginEntity = model.data?.toEntity;
    if (loginEntity != null) return loginEntity;
    throw ServerFailure('Login failed');
  }

  @override
  Future<void> setForgetPasswordOtp({required String email}) async {
    await _apiService.postData(
      endPoint: AppEndpoints.sendForgetPasswordOtp,
      data: {
        'email': email,
      },
    );
  }

  @override
  Future<LoginEntity> resetPassword(
      {required String email,
      required String otp,
      required String newPassword}) async {
    final response = await _apiService.postData(
      endPoint: AppEndpoints.resetPassword,
      formData: {
        'email': email,
        'otp': otp,
        'password': newPassword,
      },
    );

    final model = LoginModel.fromJson(response.data);
    final loginEntity = model.data?.toEntity;
    if (loginEntity != null) return loginEntity;
    throw ServerFailure('Reset password failed');
  }
}
