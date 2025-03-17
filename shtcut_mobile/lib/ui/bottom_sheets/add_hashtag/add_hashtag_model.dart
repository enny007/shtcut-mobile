import 'package:flutter/cupertino.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddHashtagModel extends BaseViewModel {
  final TextEditingController hashtagNamecontroller = TextEditingController();
  final TextEditingController hashtagValuecontroller = TextEditingController();
  Function(SheetResponse)? completer;

  AddHashtagModel({this.completer});
  String? titlevalidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a hashtag title';
    }
    return null;
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a hashtag name';
    }
    return null;
  }

  Future<void> showHashtagCreatedSheet() async {
    completer!(SheetResponse(confirmed: true));
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.hashtagCreated,
    );
  }

  @override
  void dispose() {
    hashtagNamecontroller.dispose();
    hashtagValuecontroller.dispose();
    super.dispose();
  }
}
