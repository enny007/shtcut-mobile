import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';
import 'package:shtcut_mobile/core/network/exceptions.dart';
import 'package:shtcut_mobile/core/service/auth_service.dart';
import 'package:shtcut_mobile/core/service/toast_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toastification/toastification.dart';

class EmailVerificationModel extends MBaseViewModel {
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  String otpCode = '';
  String email = '';
  static const int otpLength = 6;
  Function(SheetResponse)? completer;

  int _resendCountdown = 0;
  int get resendCountdown => _resendCountdown;
  Timer? _resendTimer;
  final _busyObject2 = Object();

  bool get isBusy2 => busy(_busyObject2);

  // Add this method to the EmailVerificationModel class:

  bool get isOtpComplete => otpCode.length == otpLength;

  void initialize({
    required String userEmail,
    required Function(SheetResponse) completer,
  }) {
    email = userEmail;
    this.completer = completer;
    // Send OTP when sheet is opened
    sendVerificationOtp();
  }

  Future<void> sendVerificationOtp() async {
    try {
      final response = await _authService.sendOtp(
        email: email,
      );

      if (response != null && response.isSuccess) {
        _toastService.showToast(
          title: "OTP Sent",
          message: "Verification code has been sent to your email",
          type: ToastificationType.success,
        );
      } else {
        throw ApiException(
          response?.meta?.error?.message ?? "An unknown error occurred",
          title: "OTP Error",
        );
      }
    } catch (e) {
      onFutureError(e, null);
    }
  }

  Future<void> verifyOtp() async {
    try {
      final response = await runBusyFuture(
        _authService.verifyUser(
          email: email,
          code: otpCode,
        ),
      );

      if (response != null && response.isSuccess) {
        _toastService.showToast(
          title: "Success",
          message: "Email verified successfully",
          type: ToastificationType.success,
        );
        completer!(SheetResponse(confirmed: true));
        showWelcomeSheet();
      } else {
        throw ApiException(
          response?.meta?.error?.message ?? "An unknown error occurred",
          title: "Verification Error",
        );
      }
    } catch (e) {
      onFutureError(e, null);
    }
  }

  Future<void> resendOtp() async {
    try {
      final response = await runBusyFuture(
        _authService.sendOtp(
          email: email,
        ),
        busyObject: _busyObject2,
      );

      if (response != null && response.isSuccess) {
        _toastService.showToast(
          title: "Code Resent",
          message: "Verification code has been resent to your email",
          type: ToastificationType.success,
        );

        // Start the countdown timer
        startResendTimer();
      } else {
        throw ApiException(
          response?.meta?.error?.message ?? "An unknown error occurred",
          title: "Verification Error",
        );
      }
    } catch (e) {
      onFutureError(e, null);
    }
  }

  void startResendTimer() {
    // Set initial countdown value
    _resendCountdown = 30;
    notifyListeners();

    // Cancel any existing timer
    _resendTimer?.cancel();

    // Create a new timer that fires every second
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _resendCountdown--;
      notifyListeners();

      // When countdown reaches zero, cancel the timer
      if (_resendCountdown <= 0) {
        timer.cancel();
      }
    });
  }

  Future<void> showWelcomeSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.welcome,
      isScrollControlled: false,
      barrierDismissible: false,
    );
  }

  void handleOtpInput(String value, int index, BuildContext context) {
    if (value.length == 1) {
      controllers[index].text = value;
      if (index < otpLength - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        FocusScope.of(context).unfocus();
      }
      otpCode = controllers.map((e) => e.text).join();
      notifyListeners();
    }
  }

  void handleBackspace(int index, BuildContext context) {
    if (index > 0) {
      focusNodes[index - 1].requestFocus();
    }
    otpCode = controllers.map((e) => e.text).join();
    notifyListeners();
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
