import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/core/service/bottom_bar_service.dart';
import 'package:stacked/stacked.dart';

class BottomNavLayoutModel extends BaseViewModel {
  final _navigationService = locator<BottomBarService>();
  
  int get currentIndex => _navigationService.currentIndex;

  void setIndex(int index) {
    _navigationService.setIndex(index);
    // Add navigation logic here based on index
    switch(index) {
      case 0:
        // Navigate to home
        break;
      case 1:
        // Navigate to links
        break;
      case 2:
        // Navigate to analytics
        break;
      case 3:
        // Navigate to profile
        break;
    }
  }
  
}
