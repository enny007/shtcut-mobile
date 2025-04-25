import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class CreateNewTaskModel extends MBaseViewModel {
  Future<void> showTaskCreated() async {
    navRouter.back();
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.taskCreated,
      isScrollControlled: true,
    );
  }
}
