import 'package:shtcut_mobile/core/base/base_service.dart';

class BottomBarService extends BaseService {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
