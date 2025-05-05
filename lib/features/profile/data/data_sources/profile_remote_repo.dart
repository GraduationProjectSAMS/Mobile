import 'package:graduation_project/features/profile/domain/entities/user_entity.dart';

abstract class ProfileRemoteRepo {
  Future<UserEntity> getUserData();

  Future<void> logout();

  Future<void> logoutFromGoogle();
}
