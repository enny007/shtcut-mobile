import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/service/bottom_bar_service.dart';
import 'package:stacked/stacked.dart';

class BottomNavLayoutModel extends BaseViewModel {
  final _navigationService = locator<BottomBarService>();

  int get currentIndex => _navigationService.currentIndex;

  void setIndex(int index) {
    final adjustedIndex = index >= 2 ? index - 1 : index;
    _navigationService.setIndex(adjustedIndex);
    // Add navigation logic here based on index
    switch (adjustedIndex) {
      case 0:
        navRouter.navigateTo(
          Routes.homeView,
        );
        break;
      case 1:
        navRouter.navigateTo(
          Routes.calendarView,
        );
        break;
      case 2:
        navRouter.navigateTo(
          Routes.recordingView,
        );
        break;
      case 3:
        navRouter.navigateTo(
          Routes.liveBroadcastView,
        );
        break;
    }
  }

  Future<void> showActionSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.action,
      isScrollControlled: true,
    );
  }
}
