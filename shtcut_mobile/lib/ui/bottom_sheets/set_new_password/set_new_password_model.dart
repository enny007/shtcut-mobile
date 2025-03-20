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

class SetNewPasswordModel extends MBaseViewModel {
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();

  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  Function(SheetResponse)? completer;

  bool get isPasswordObscured => _isPasswordObscured;
  bool get isConfirmPasswordObscured => _isConfirmPasswordObscured;

  String email = '';
  String otpCode = '';
  bool _isPasswordsMatch = false;
  bool get isPasswordsMatch => _isPasswordsMatch;
  void initialize(
    String userEmail,
    String code,
    Function(SheetResponse)? completerFunction,
  ) {
    completer = completerFunction;
    email = userEmail;
    otpCode = code;

    // Add listeners to validate password match
    passwordController.addListener(_validatePasswords);
    confirmPasswordController.addListener(_validatePasswords);
  }

  void _validatePasswords() {
    if (passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      _isPasswordsMatch =
          passwordController.text == confirmPasswordController.text;
      notifyListeners();
    } else {
      _isPasswordsMatch = false;
      notifyListeners();
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for at least one special character
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>_]');
    if (!specialCharRegex.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    // Check for at least one uppercase letter
    final uppercaseRegex = RegExp(r'[A-Z]');
    if (!uppercaseRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for at least one number
    final numberRegex = RegExp(r'[0-9]');
    if (!numberRegex.hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    // Check if the field is empty
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }

    // Check if it matches the password
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  void togglePasswordVisibility() {
    _isPasswordObscured = !_isPasswordObscured;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
    notifyListeners();
  }

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> resetPassword() async {
    try {
      final response = await runBusyFuture(
        _authService.resetPassword(
          email: email,
          code: otpCode,
          password: passwordController.text,
        ),
      );

      if (response != null && response.isSuccess) {
        _toastService.showToast(
          title: "Success",
          message: "Your password has been reset successfully",
          type: ToastificationType.success,
        );
        completer!(SheetResponse(confirmed: true));
        showPasswordConfirmationSheet();
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

  Future<void> showPasswordConfirmationSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.passwordConfirmation,
      barrierDismissible: false,
      isScrollControlled: true,
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
      ];
}
