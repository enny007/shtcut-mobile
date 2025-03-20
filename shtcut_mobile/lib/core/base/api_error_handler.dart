import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';
import 'package:shtcut_mobile/app/app.logger.dart';
import 'package:shtcut_mobile/core/network/exceptions.dart';

mixin ApiErrorHandler {
  void handleError(Object e, {Logger? logger}) {
    Logger log = logger ?? getLogger(runtimeType.toString());
    log.e("Error: $e");
    if (e is DioException) {
      if (e.type == DioExceptionType.unknown) {
        if (e.toString().contains('SocketException') ||
            e.toString().contains("Network is unreachable")) {
          throw InternetConnectionException();
        }
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        throw "Connection Timeout! Please, check your internet connection and try again!";
      }
    } else if (e is TypeError) {
      log.e("StackTrace: ${e.stackTrace}");
    } else if (e is NoSuchMethodError) {
      log.e("StackTrace: ${e.stackTrace}");
    }
  }
}
