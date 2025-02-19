import 'package:shtcut_mobile/ui/bottom_sheets/email_verification/email_verification_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/forgot_password/forgot_password_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/welcome/welcome_sheet.dart';
import 'package:shtcut_mobile/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:shtcut_mobile/ui/views/onboarding/onboarding_view.dart';
import 'package:shtcut_mobile/ui/views/sign_up/sign_up_view.dart';
import 'package:shtcut_mobile/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(
      page: StartupView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: OnboardingView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: SignUpView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: ForgotPasswordSheet),
    StackedBottomsheet(classType: WelcomeSheet),
    StackedBottomsheet(classType: EmailVerificationSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
