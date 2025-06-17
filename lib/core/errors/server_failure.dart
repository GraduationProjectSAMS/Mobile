import 'package:dio/dio.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:logger/logger.dart';

import '../utilities/resources/app_strings.dart';
import 'failure.dart';

class ServerFailure extends Failure {
  final int? statusCode;

  ServerFailure(super.errorMessage, {this.statusCode});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(AppStrings.connectionTimeoutFromApiServer,
            statusCode: AppConstants.connectionTimeoutCode);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(AppStrings.receiveTimeoutFromApiServer);
      case DioExceptionType.badCertificate:
        return ServerFailure(AppStrings.incorrectCertificate);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode ?? 0,
            dioException.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure(AppStrings.cancelFromApiServer);
      case DioExceptionType.connectionError:
        return ServerFailure(AppStrings.checkConnection);
      case DioExceptionType.sendTimeout:
        return ServerFailure(AppStrings.sendTimeoutFromApiServer);
      case DioExceptionType.unknown:
        return ServerFailure(AppStrings.somethingWentWrongTryAgain);
    }
  }

  factory ServerFailure.fromResponse(int errorNumber, dynamic response) {
    Logger().e(response);
    if (errorNumber == 400 ||
        errorNumber == 401 ||
        errorNumber == 403 ||
        errorNumber == 422 ||
        errorNumber == 502) {
      return ServerFailure(
          (response['error'] ?? response['message']).toString(),
          statusCode: errorNumber);
    } else if (errorNumber == 404) {
      return ServerFailure(AppStrings.methodNotFound);
    } else if (errorNumber == 500) {
      return ServerFailure(AppStrings.internalServerError,
          statusCode: errorNumber);
    } else {
      return ServerFailure(AppStrings.oopsTryAgain);
    }
  }
}
/*
class CacheFailure extends Failure {
  CacheFailure(super.errorMessage);
  factory CacheFailure.fromError(FileSystemException  fileSystemException) {
   switch(fileSystemException.osError?.errorCode){
     case 2:
       return CacheFailure(fileSystemException.message);
     case 13:
       return CacheFailure(fileSystemException.message);
     default:
       return CacheFailure(AppStrings.somethingWentWrongTryAgain);
   }
  }
}*/
