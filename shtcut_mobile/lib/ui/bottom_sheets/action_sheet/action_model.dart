import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:stacked/stacked.dart';

class ActionModel extends BaseViewModel {
  void navigateToCreatePost() {
    navRouter.back();
    navRouter.navigateToCreatePostView();
  }

  void navigateToAllPostView() {
    navRouter.back();
    navRouter.navigateToAllPostView();
  }

  void navigateToMediaLibrary() {
    navRouter.back();
    navRouter.navigateToMediaLibraryView();
  }

  void navigateToTaskView() {
    navRouter.back();
    navRouter.navigateToTasksView();
  }

  void navigateToSocialListeningView() {
    navRouter.back();
    navRouter.navigateToSocialListeningView();
  }

  void navigateToMessagingView() {
    navRouter.back();
    navRouter.navigateToMessagingView();
  }

  void navigateToAdCampaignView() {
    navRouter.back();
    navRouter.navigateToAdManagementView();
  }

  void navigateToReportsView() {
    navRouter.back();
    navRouter.navigateToReportsView();
  }
}
