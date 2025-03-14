import 'package:dio/dio.dart';

import '../resources/app_constants.dart';
import 'cache_service.dart';

class DioInterceptor extends Interceptor {
  static bool isDialogShowing = false;

  const DioInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    CacheService.token = CacheService.getData(key: AppConstants.token);
    //  CacheService.baseUrl =CacheService.getData(key: AppConstants.baseUrl);
    if (CacheService.token != null) {
      options.headers["Authorization"] = "Bearer ${CacheService.token}";
      // }if( CacheService.baseUrl !=null){
      //     options.baseUrl= CacheService.baseUrl!;
      //   }
      super.onRequest(options, handler);
    }
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
