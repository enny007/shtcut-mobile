import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastService {
  void showToast({
    required String title,
    required String message,
    required ToastificationType type,
    AlignmentGeometry? alignment = Alignment.topCenter,
    Duration time = const Duration(seconds: 4),
    VoidCallback? ontap,
  }) {
    toastification.show(
      type: type,
      style: ToastificationStyle.flat,
      title: Text(
        title,
      ),
      description: Text(message),
      alignment: alignment,
      autoCloseDuration: time,
      applyBlurEffect: false,
      showProgressBar: false,
      callbacks: ToastificationCallbacks(
        onTap: (value) {
          ontap != null ? ontap() : null;
        },
      ),
    );
  }
}
