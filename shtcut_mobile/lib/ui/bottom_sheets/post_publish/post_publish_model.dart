import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class PostPublishModel extends MBaseViewModel {
  Function(SheetResponse)? completer;

  PostPublishModel({this.completer});
  void navigateToEditPost() {
    navRouter.back();
    navRouter.navigateToCreatePostContentView(
      isEditView: true,
    );
  }

  Future<void> showSuccessfulPostSheet() async {
    navRouter.back();
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.publishPost,
      isScrollControlled: true,
    );
  }
}
