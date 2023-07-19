import 'package:dio/dio.dart';

abstract class NetworkResponses {
  NetworkResponses();
}

class NetworkSuccessResponses<T> extends NetworkResponses {
  T model;
  NetworkSuccessResponses(this.model);
}


class NetworkExceptionError extends NetworkResponses {
  String exceptionMessage;
  NetworkExceptionError(this.exceptionMessage);
}

