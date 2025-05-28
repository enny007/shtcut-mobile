import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class AdCampaignBudgetViewModel extends MBaseViewModel {
  double _dailyBudget = 0;
  double _duration = 1;

  double get dailyBudget => _dailyBudget;
  double get duration => _duration;

  double get estimatedReach =>
      _dailyBudget * _duration * 100; // Example calculation
  double get total => _dailyBudget * _duration;

  void updateDailyBudget(double value) {
    _dailyBudget = value;
    notifyListeners();
  }

  void updateDuration(double value) {
    _duration = value;
    notifyListeners();
  }

  void navigateToAdCampaignReviewView() {
    navRouter.navigateToCampaignReviewView();
  }
}
