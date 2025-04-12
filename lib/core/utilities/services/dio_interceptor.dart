import 'package:dio/dio.dart';

import '../resources/app_constants.dart';
import 'cache_service.dart';

class DioInterceptor extends Interceptor {
  const DioInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    CacheService.token = CacheService.getData(key: AppConstants.token);

    if (CacheService.token != null) {
      options.headers["Authorization"] = "Bearer ${CacheService.token}";
    }
    super.onRequest(options, handler);

    // @override
    // void onError(DioException err, ErrorInterceptorHandler handler) {
    //   if(err.response?.statusCode == AppConstants.unauthenticated && !isDialogShowing && CacheService.token != null){
    //     isDialogShowing = true;
    //
    //     showExpiredTokenDialog(MyApp.navigatorKey.currentContext!);
    //   }
    //   super.onError(err, handler);
    // }
  }
}
