import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';
import 'package:graduation_project/core/utilities/services/google_sign_in_service.dart';
import 'package:graduation_project/features/profile/domain/entities/user_entity.dart';

import '../../../../core/utilities/services/api_service.dart';
import '../models/user_model.dart';
import 'profile_remote_repo.dart';

class ProfileRemoteRepoImpl implements ProfileRemoteRepo {
  final ApiService apiService;
  final GoogleSignInService googleSignInService;

  ProfileRemoteRepoImpl(this.apiService, this.googleSignInService);

  @override
  Future<UserEntity> getUserData() async {
    CacheService.userId = CacheService.getData(key: AppConstants.userId);
    final response = await apiService.getData(
        endPoint: '${AppEndpoints.profile}/${CacheService.userId}');
    final model = UserModel.fromJson(response?.data);
    final entity = model.data?.toEntity;
    return entity ?? UserEntity.loading();
  }

  @override
  Future<void> logout() async {
    await apiService.postData(endPoint: AppEndpoints.logout);
  }

  @override
  Future<void> logoutFromGoogle() async {
    await googleSignInService.signOut();
  }

// Implement methods here
}
