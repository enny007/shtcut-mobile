import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class UpdatePasswordModel extends MBaseViewModel {
  Future<void> showForgotSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.forgotPasswordOtp,
      isScrollControlled: true,
      barrierDismissible: false,
    );
  }
}
