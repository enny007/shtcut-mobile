import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';
import 'package:shtcut_mobile/core/network/exceptions.dart';
import 'package:shtcut_mobile/core/service/auth_service.dart';
import 'package:shtcut_mobile/core/service/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:toastification/toastification.dart';

class SignInViewModel extends MBaseViewModel {
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();

  final _busyObject2 = Object();
  final _busyObject3 = Object();

  bool get isBusy2 => busy(_busyObject2);
  bool get isBusy3 => busy(_busyObject3);
  bool _isPasswordObscured = true;
  // bool _acceptedTerms = false;

  bool get isPasswordObscured => _isPasswordObscured;
  // bool get acceptedTerms => _acceptedTerms;
  bool _isValid = false;
  bool get isValid => _isValid;

  SignInViewModel() {
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    final isEmailValid = emailController.text.isNotEmpty &&
        validateEmail(emailController.text) == null;
    final isPasswordValid = passwordController.text.isNotEmpty &&
        validatePassword(passwordController.text) == null;

    _isValid = isEmailValid && isPasswordValid;

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

  void togglePasswordVisibility() {
    _isPasswordObscured = !_isPasswordObscured;
    notifyListeners();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> showForgotPasswordSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.forgotPassword,
      isScrollControlled: true,
      barrierDismissible: true,
    );
    // if (response?.confirmed == true) {}
  }

  Future<void> signIn() async {
    try {
      final response = await runBusyFuture(
        _authService.signIn(
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      if (response != null && response.isSuccess) {
        _toastService.showToast(
          title: "Success",
          message: response.meta!.message ?? "Sign in successful",
          type: ToastificationType.success,
        );

        // Navigate to next screen based on response

        navRouter.clearStackAndShow(Routes.connectAccountsView);
      } else {
        throw ApiException(
          response?.meta?.error?.message ?? "An unknown error occurred",
          title: "Sign In Error",
        );
      }
    } catch (e) {
      onFutureError(e, null);
    }
  }

  Future<void> googleSignIn() async {
    try {
      final response = await runBusyFuture(
        _authService.socialSignIn(
          socialType: 'google',
        ),
        busyObject: _busyObject2,
      );

      if (response != null && response.isSuccess) {
        _toastService.showToast(
          title: "Success",
          message: response.meta!.message ?? "Google sign in successful",
          type: ToastificationType.success,
        );

        // Navigate to next screen based on response

        navRouter.clearStackAndShow(Routes.connectAccountsView);
      } else {
        throw ApiException(
          response?.meta?.error?.message ?? "An unknown error occurred",
          title: "Google Sign In Error",
        );
      }
    } catch (e) {
      onFutureError(e, null);
    }
  }

  void navigateToConnectAccount() {
    navRouter.navigateToConnectAccountsView();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
      ];
}
