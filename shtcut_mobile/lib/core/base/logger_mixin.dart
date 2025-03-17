// ignore_for_file: depend_on_referenced_packages
import 'package:shtcut_mobile/app/app.logger.dart';
import 'package:logger/logger.dart';

mixin LoggerMixin {
  Logger get logger => getLogger(runtimeType.toString());
}
