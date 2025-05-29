import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class ChangePasswordViewModel extends MBaseViewModel {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  // Password visibility states
  bool _isCurrentPasswordObscured = true;
  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  // Getters for password visibility
  bool get isCurrentPasswordObscured => _isCurrentPasswordObscured;
  bool get isNewPasswordObscured => _isNewPasswordObscured;
  bool get isConfirmPasswordObscured => _isConfirmPasswordObscured;

  // Toggle methods for password visibility
  void toggleCurrentPasswordVisibility() {
    _isCurrentPasswordObscured = !_isCurrentPasswordObscured;
    notifyListeners();
  }

  void toggleNewPasswordVisibility() {
    _isNewPasswordObscured = !_isNewPasswordObscured;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
    notifyListeners();
  }

  // Validation methods
  String? validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Current password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'New password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
      return 'Password must contain uppercase, lowercase and number';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Method to handle password change
  Future<void> changePassword() async {
    setBusy(true);

    try {
      // Validate all fields
      final currentPasswordError =
          validateCurrentPassword(currentPasswordController.text);
      final newPasswordError = validateNewPassword(newPasswordController.text);
      final confirmPasswordError =
          validateConfirmPassword(confirmNewPasswordController.text);

      if (currentPasswordError != null ||
          newPasswordError != null ||
          confirmPasswordError != null) {
        // Handle validation errors
        return;
      }

      // TODO: Implement API call to change password
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      // Clear fields on success
      currentPasswordController.clear();
      newPasswordController.clear();
      confirmNewPasswordController.clear();

      // Show success message
      // You can use your preferred method to show success message
      print('Password changed successfully');
    } catch (e) {
      // Handle error
      print('Error changing password: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> showUpdatePasswordSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.updatePassword,
      isScrollControlled: true,
    );
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }
}
