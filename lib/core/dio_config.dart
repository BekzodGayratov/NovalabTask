import 'package:dio/dio.dart';

class DioHandleError {
  static String from(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connect time out";
      case DioExceptionType.receiveTimeout:
        return "Receive time out";
      case DioExceptionType.sendTimeout:
        return "Send time out";
      case DioExceptionType.unknown:
        return "No internet connection";
      default:
        return "Unknown error";
    }
  }
}
