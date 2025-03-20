import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeModel extends MBaseViewModel {
  Function(SheetResponse)? completer;

  WelcomeModel(this.completer);
  void navigateToConnectSocials() {
    completer!(
      SheetResponse(
        confirmed: true,
      ),
    );
    navRouter.navigateToConnectAccountsView();
  }
}
