import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class UserProfileViewModel extends MBaseViewModel {
  void navigateToEditProfile() {
    navRouter.navigateToPersonalDataView();
  }

  void navigateToNotifications() {
    navRouter.navigateToNotificationView();
  }

  void navigateToChangePassword() {
    navRouter.navigateToChangePasswordView();
  }

  void navigateToHelpSupport() {
    navRouter.navigateToHelpSupportView();
  }
}
