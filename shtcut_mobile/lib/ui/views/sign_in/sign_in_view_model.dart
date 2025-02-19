import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel {
  bool _isPasswordObscured = true;
  // bool _acceptedTerms = false;

  bool get isPasswordObscured => _isPasswordObscured;
  // bool get acceptedTerms => _acceptedTerms;

  void togglePasswordVisibility() {
    _isPasswordObscured = !_isPasswordObscured;
    notifyListeners();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void showForgotPasswordSheet() async {
    final response = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.forgotPassword,
    );
    if (response?.confirmed == true) {
      showForgotPasswordOTP();
    }
  }

  void showForgotPasswordOTP() async {
    final response = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.forgotPasswordOtp,
    );
    if (response?.confirmed == true) {
      showSetNewPasswordSheet();
    }
  }

  void showSetNewPasswordSheet() async {
    final response = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.setNewPassword,
    );
    if (response?.confirmed == true) {
      showPasswordConfirmationSheet();
    }
  }

  void showPasswordConfirmationSheet() async {
    final response = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.passwordConfirmation,
    );
    if (response?.confirmed == true) {}
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
