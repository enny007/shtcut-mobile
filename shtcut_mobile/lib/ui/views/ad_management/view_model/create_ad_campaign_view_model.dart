import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class CreateAdCampaignViewModel extends MBaseViewModel {
  void navigateToCampaignGoal() {
    navRouter.navigateToCampaignGoalView();
  }
}
