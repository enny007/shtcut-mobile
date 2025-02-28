import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  bool _isPasswordObscured = true;
  bool _acceptedTerms = false;

  bool get isPasswordObscured => _isPasswordObscured;
  bool get acceptedTerms => _acceptedTerms;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    _isPasswordObscured = !_isPasswordObscured;
    notifyListeners();
  }

  void setAcceptedTerms(bool? value) {
    _acceptedTerms = value ?? false;
    notifyListeners();
  }

  void showEmailVerificationSheet() async {
    final response = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.emailVerification,
      isScrollControlled: false,
    );

    if (response?.confirmed == true) {
      showWelcomeSheet();
      // navRouter.back();
    }
  }

  void showWelcomeSheet() {
    bottomSheetService.showCustomSheet(
      variant: BottomSheetType.welcome,
      isScrollControlled: false,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
