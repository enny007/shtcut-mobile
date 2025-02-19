import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.dialogs.dart';
import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class AppSetup {
  static Future<void> initialize() async {
    await setupLocator();
    setupDialogUi();
    setupBottomSheetUi();
  }
}

NavigationService get navRouter => locator<NavigationService>();
DialogService get dialogService => locator<DialogService>();
BottomSheetService get bottomSheetService => locator<BottomSheetService>();
