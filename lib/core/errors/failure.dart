import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/server_failure.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}
Failure appServerFailure(Object error) {
  if (error is DioException) {
    return ServerFailure.fromDioError(error);
  }
  return ServerFailure(error.toString());
}
