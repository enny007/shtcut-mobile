import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class ActiveMessageViewModel extends MBaseViewModel {
  final chatController = TextEditingController();

  void navigateToMessageProfile() {
    navRouter.navigateToMessageProfileView();
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }
}
