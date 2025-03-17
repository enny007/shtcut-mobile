import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/label_manager/widgets/label_tile.dart';
import 'package:stacked/stacked.dart';

class AddLabelsModel extends BaseViewModel {
  final TextEditingController labelController = TextEditingController();

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a label';
    }
    return null;
  }

  Color _selectedColor = LabelColors.redLabel; // Default to red
  Color get selectedColor => _selectedColor;

  void selectColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  Future<void> showLabelCreatedSheet() async {
    navRouter.back();
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.labelCreated,
      isScrollControlled: true,
    );
  }

  @override
  void dispose() {
    labelController.dispose();
    super.dispose();
  }
}
