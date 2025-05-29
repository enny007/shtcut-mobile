import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class UpdateProfileModel extends MBaseViewModel {
  Future<void> showUpdatedProfile() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.profileUpdated,
      isScrollControlled: true,
    );
  }
}
