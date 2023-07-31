import 'package:dio/dio.dart';

abstract class Failure {
  final String messsage;

  Failure(this.messsage);
}

class ServerFailure extends Failure {
  ServerFailure(super.messsage);
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with Api server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with Api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with Api server");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate with api server");
      case DioExceptionType.badResponse:
        // Bad Response
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to Api server was canceld");
      case DioExceptionType.connectionError:
        return ServerFailure("No internet connection");
      case DioExceptionType.unknown:
        return ServerFailure("Opps There was an Error, Please try again");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, Please try later');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with server, Please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There was an error , Please try again');
    }
  }
}
