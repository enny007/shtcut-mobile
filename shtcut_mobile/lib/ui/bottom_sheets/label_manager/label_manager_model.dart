import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:stacked/stacked.dart';

class LabelManagerModel extends BaseViewModel {
  final TextEditingController labelController = TextEditingController();

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a label';
    }
    return null;
  }

  Future<void> showAddLabelSheet() async {
    navRouter.back();
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addLabels,
      isScrollControlled: true,
    );
  }

  @override
  void dispose() {
    labelController.dispose();
    super.dispose();
  }
}
