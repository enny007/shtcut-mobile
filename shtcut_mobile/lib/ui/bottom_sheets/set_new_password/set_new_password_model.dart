import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SetNewPasswordModel extends BaseViewModel {
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  bool get isPasswordObscured => _isPasswordObscured;
  bool get isConfirmPasswordObscured => _isConfirmPasswordObscured;
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
}
