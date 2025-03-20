import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/core/base/api_error_handler.dart';
import 'package:shtcut_mobile/core/base/logger_mixin.dart';
import 'package:shtcut_mobile/core/network/dio_client.dart';

class BaseApi with ApiErrorHandler, LoggerMixin {
  DioClient get dioClient => locator<DioClient>();
}
