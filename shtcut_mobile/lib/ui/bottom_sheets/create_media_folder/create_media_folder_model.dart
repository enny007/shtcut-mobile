import 'package:flutter/material.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class CreateMediaFolderModel extends MBaseViewModel {
  final folderNameController = TextEditingController();

  @override
  void dispose() {
    folderNameController.dispose();
    super.dispose();
  }
}
