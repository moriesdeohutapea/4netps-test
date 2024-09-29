import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handleError(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return "Request to the server was cancelled";
        case DioExceptionType.connectionTimeout:
          return "Connection timeout with the server";
        case DioExceptionType.unknown:
          return "No internet connection";
        case DioExceptionType.receiveTimeout:
          return "Receive timeout in connection with the server";
        case DioExceptionType.badResponse:
          return _handleHttpError(error.response?.statusCode);
        case DioExceptionType.sendTimeout:
          return "Send timeout in connection with the server";
        case DioExceptionType.badCertificate:
          return "Bad certificate error";
        case DioExceptionType.connectionError:
          return "Connection error";
      }
    } else {
      return "Unexpected error occurred";
    }
  }

  static String _handleHttpError(int? statusCode) {
    if (statusCode != null) {
      switch (statusCode) {
        case 400:
          return "Bad request";
        case 401:
          return "Unauthorized request";
        case 403:
          return "Access forbidden";
        case 404:
          return "Resource not found";
        case 500:
          return "Internal server error";
        case 503:
          return "Service unavailable";
        default:
          return "Received invalid status code: $statusCode";
      }
    } else {
      return "No status code received";
    }
  }
}
