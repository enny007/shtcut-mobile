import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/core/base/logger_mixin.dart';
import 'package:shtcut_mobile/core/models.dart/meta.dart';
import 'package:shtcut_mobile/core/network/exceptions.dart';
import 'package:shtcut_mobile/core/service/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:toastification/toastification.dart';

class MBaseViewModel extends ReactiveViewModel with LoggerMixin {
  final _toastService = locator<ToastService>();

  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
    logger.e('Error occurred: $error');

    String title = 'Error';
    String message;

    if (error is ApiException) {
      title = error.title;
      message = error.message;
    } else if (error is DioException) {
      if (error.response?.data is Map<String, dynamic>) {
        final meta =
            Meta.fromJson(error.response!.data['meta'] as Map<String, dynamic>);
        message = meta.effectiveErrorMessage;
      } else {
        message = error.message ?? 'An unknown error occurred';
      }
    } else {
      message = error.toString();
    }

    _showErrorToast(title, message);
  }

  void _showErrorToast(String title, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _toastService.showToast(
        title: title,
        message: message.substring(0, min(message.length, 150)),
        type: ToastificationType.error,
        alignment: Alignment.topCenter,
      );
    });
  }
}
