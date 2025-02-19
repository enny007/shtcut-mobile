import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordModel extends BaseViewModel {
  final emailController = TextEditingController();

  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  String otpCode = '';
  static const int otpLength = 6;

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
    for (var controller in controllers) {
      controller.dispose();
    }
    emailController.dispose();
    super.dispose();
  }
}
