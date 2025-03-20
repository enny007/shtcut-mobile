import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';
import 'package:shtcut_mobile/core/network/exceptions.dart';
import 'package:shtcut_mobile/core/service/auth_service.dart';
import 'package:shtcut_mobile/core/service/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordModel extends MBaseViewModel {
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();

  final emailController = TextEditingController();
  Function(SheetResponse)? completer;
  final _busyObject2 = Object();

  bool get isBusy2 => busy(_busyObject2);

  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  String otpCode = '';
  static const int otpLength = 6;

  bool get isOtpComplete => otpCode.length == otpLength;
  bool _isValid = false;
  bool get isValid => _isValid;

  ForgotPasswordModel(this.completer) {
    emailController.addListener(_validateForm);
  }

  void _validateForm() {
    final isEmailValid = emailController.text.isNotEmpty &&
        validateEmail(emailController.text) == null;

    _isValid = isEmailValid;

    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> sendPasswordResetCode() async {
    try {
      final response = await runBusyFuture(
        _authService.passwordReset(
          email: emailController.text,
        ),
      );

      if (response != null && response.isSuccess) {
        _toastService.showToast(
          title: "Code Sent",
          message: "Password reset code has been sent to your email",
          type: ToastificationType.success,
        );
        completer?.call(SheetResponse(confirmed: true));
        showForgotPasswordOTP();
      } else {
        throw ApiException(
          response?.meta?.error?.message ?? "An unknown error occurred",
          title: "Password Reset Error",
        );
      }
    } catch (e) {
      onFutureError(e, null);
    }
  }

  Future<void> showForgotPasswordOTP() async {
    final response = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.forgotPasswordOtp,
      isScrollControlled: true,
      barrierDismissible: false,
      data: {
        'email': emailController.text,
      },
    );
    if (response?.confirmed == true) {
      final data = response?.data;
      final otpCode =
          data != null && data is Map ? data['otpCode']?.toString() ?? '' : '';
      final email = data != null && data is Map
          ? data['email']?.toString() ?? emailController.text
          : emailController.text;
      if (otpCode.isNotEmpty && email.isNotEmpty) {
        await showSetNewPasswordSheet(
          passCode: otpCode,
          email: email,
        );
      } else {
        _toastService.showToast(
          title: "Error",
          message: "Failed to get verification code. Please try again.",
          type: ToastificationType.error,
        );
      }
    }
  }

  Future<void> showSetNewPasswordSheet({
    required String passCode,
    required String email,
  }) async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.setNewPassword,
      barrierDismissible: false,
      isScrollControlled: true,
      data: {
        'otpCode': passCode,
        'email': email,
      },
    );
  }

  int _resendCountdown = 0;
  int get resendCountdown => _resendCountdown;
  Timer? _resendTimer;
  Future<void> resendCode() async {
    try {
      final response = await runBusyFuture(
        _authService.passwordReset(
          email: emailController.text,
        ),
        busyObject: _busyObject2,
      );

      if (response != null && response.isSuccess) {
        _toastService.showToast(
          title: "Code Resent",
          message: "Password reset code has been resent to your email",
          type: ToastificationType.success,
        );
        startResendTimer();
      } else {
        throw ApiException(
          response?.meta?.error?.message ?? "An unknown error occurred",
          title: "Password Reset Error",
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
    emailController.dispose();
    super.dispose();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
      ];
}
