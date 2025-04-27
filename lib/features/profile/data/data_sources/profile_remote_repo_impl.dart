import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';
import 'package:graduation_project/features/profile/domain/entities/user_entity.dart';

import '../../../../core/utilities/services/api_service.dart';
import '../models/user_model.dart';
import 'profile_remote_repo.dart';

class ProfileRemoteRepoImpl implements ProfileRemoteRepo {
  final ApiService apiService;

  ProfileRemoteRepoImpl(this.apiService);

  @override
  Future<UserEntity> getUserData() async{
    final response = await apiService.getData(endPoint: '${AppEndpoints.profile}/${CacheService.userId}');
final model = UserModel.fromJson(response?.data);
final entity = model.data?.toEntity;
    return entity??UserEntity.loading();

  }

// Implement methods here
}
