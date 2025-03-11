import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:stacked/stacked.dart';

class ActionModel extends BaseViewModel {
  void navigateToCreatePost() {
    navRouter.back();
    navRouter.navigateToCreatePostView();
  }
}
