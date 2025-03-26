import 'package:flutter/material.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class UnsplashViewModel extends MBaseViewModel {
  final _unsplashController = TextEditingController();


  TextEditingController get unsplashController => _unsplashController;

  @override
  void dispose() {
    _unsplashController.dispose();
    super.dispose();
  }
}
