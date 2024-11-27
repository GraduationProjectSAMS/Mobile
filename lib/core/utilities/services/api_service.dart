
import 'package:dio/dio.dart';

import 'dio_interceptor.dart';



class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    _dio.interceptors.add(const DioInterceptor());
    _dio.options.receiveTimeout = const Duration(seconds: 25);
  }

  Future<Response?> getData({
    required String endPoint,
    Map<String, dynamic>? data,
    int ?timeOutSeconds ,
  }) async {
    if (timeOutSeconds != null) {
      _dio.options.receiveTimeout = Duration(seconds: timeOutSeconds );

    }
    return await _dio.get(endPoint, queryParameters: data);
  }

  Future<Response> postData({required String endPoint,

    Object? formData,
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? data,
    int ?timeOutSeconds ,
    void Function(int, int)? onSendProgress,
  }) async {
    if (timeOutSeconds != null) {
      _dio.options.receiveTimeout = Duration(seconds: timeOutSeconds );
      _dio.options.connectTimeout = Duration(seconds: timeOutSeconds );
      _dio.options.sendTimeout = const Duration(minutes: 20);
    }

    return await _dio.post(endPoint, queryParameters: data,
        data: formData,
        options: options,
       cancelToken: cancelToken,
        onSendProgress: onSendProgress,

    );
  }

  Future<Response> updateData({required String endPoint,


    Object? formData,
    Options? options,
    Map<String, dynamic>? data,
    void Function(int, int)? onSendProgress,
    int ?timeOutSeconds ,
  }) async {
    if (timeOutSeconds != null) {
      _dio.options.sendTimeout = Duration(seconds: timeOutSeconds );

    }
    return await _dio.patch(endPoint, queryParameters: data,
      data: formData,
      options: options,
      onSendProgress: onSendProgress,
    );
  }

  Future<Response> deleteData({required String endPoint,

    Object? formData,
    Options? options,
    Map<String, dynamic>? data,
  }) async {
    return await _dio.delete(endPoint, queryParameters: data,
      data: formData,
      options: options,
    );
  }
  Future<void> downloadWithDio({required String link,required String filePass,void Function(int, int)? onReceiveProgress})async{
    await _dio.download(link, filePass,onReceiveProgress: onReceiveProgress);
  }

  // this method used only for know if school url is valid or not

}

/*class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}*/
