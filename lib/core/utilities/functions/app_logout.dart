import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';

import '../../../features/profile/domain/use_cases/logout_form_google_use_case.dart';
import '../services/dependency_injection_service.dart';

Future<void> appLogout() async {
  Future.wait([
    getIt.get<LogoutFormGoogleUseCase>().call(),
    CacheService.removeData(key: AppConstants.token),
    CacheService.removeData(key: AppConstants.userId),
  ]);
}
