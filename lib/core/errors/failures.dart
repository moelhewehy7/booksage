import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with serverapi");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Timeout timeout with serverapi");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive timeout with serverapi");
      case DioExceptionType.badCertificate:
        return ServerFailure("bad Certificate  with serverapi");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Connection timeout with serverapi");
      case DioExceptionType.connectionError:
        return ServerFailure("There is no internet Connection");
      case DioExceptionType.unknown:
        if (e.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
