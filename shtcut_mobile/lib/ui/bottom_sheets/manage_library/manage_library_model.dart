import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class ManageLibraryModel extends MBaseViewModel {
  void navigateToUnsplash() {
    navRouter.navigateToUnsplashView();
  }

  Future<void> showUploadSheet() async {
    navRouter.back();
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.mediaUpload,
      isScrollControlled: true,
    );
  }

  Future<void> showCreateFolderSheet() async {
    navRouter.back();
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.createMediaFolder,
      isScrollControlled: true,
    );
  }
}
