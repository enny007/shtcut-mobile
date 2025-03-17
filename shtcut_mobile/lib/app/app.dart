import 'package:shtcut_mobile/core/service/bottom_bar_service.dart';
import 'package:shtcut_mobile/core/service/local_storage_service.dart';
import 'package:shtcut_mobile/core/service/media_service.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/action_sheet/action_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/add_hashtag/add_hashtag_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/add_hashtag/hashtag_created_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/add_labels/add_labels_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/email_verification/email_verification_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/forgot_password/forgot_password_otp_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/forgot_password/forgot_password_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/hashtag/hashtag_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/label_created/label_created_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/label_manager/label_manager_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/password_confirmation/password_confirmation_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/permission_sheet/permission_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/set_new_password/set_new_password_sheet.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/welcome/welcome_sheet.dart';
import 'package:shtcut_mobile/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:shtcut_mobile/ui/views/calendar/calendar_view.dart';
import 'package:shtcut_mobile/ui/views/connect_accounts/connect_accounts_view.dart';
import 'package:shtcut_mobile/ui/views/create_post/create_post_content_view.dart';
import 'package:shtcut_mobile/ui/views/create_post/create_post_view.dart';
import 'package:shtcut_mobile/ui/views/home/home_view.dart';
import 'package:shtcut_mobile/ui/views/live_broadcast/live_broadcast_view.dart';
import 'package:shtcut_mobile/ui/views/onboarding/onboarding_view.dart';
import 'package:shtcut_mobile/ui/views/recording/recording_view.dart';
import 'package:shtcut_mobile/ui/views/sign_in/sign_in_view.dart';
import 'package:shtcut_mobile/ui/views/sign_up/sign_up_view.dart';
import 'package:shtcut_mobile/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(routes: [
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
  CustomRoute(
    page: SignInView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: ConnectAccountsView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: HomeView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: CalendarView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: RecordingView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: LiveBroadcastView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: CreatePostView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: CreatePostContentView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  // @stacked-route
], dependencies: [
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: BottomBarService),
  LazySingleton(classType: MediaService),
  LazySingleton(classType: SharedPreferencesService),
  // @stacked-service
], bottomsheets: [
  StackedBottomsheet(classType: NoticeSheet),
  StackedBottomsheet(classType: ForgotPasswordSheet),
  StackedBottomsheet(classType: ForgotPasswordOtpSheet),
  StackedBottomsheet(classType: WelcomeSheet),
  StackedBottomsheet(classType: EmailVerificationSheet),
  StackedBottomsheet(classType: SetNewPasswordSheet),
  StackedBottomsheet(classType: PasswordConfirmationSheet),
  StackedBottomsheet(classType: ActionSheet),
  StackedBottomsheet(classType: PermissionSheet),
  StackedBottomsheet(classType: HashtagCreatedSheet),
  StackedBottomsheet(classType: AddHashtagSheet),
  StackedBottomsheet(classType: HashtagSheet),
  StackedBottomsheet(classType: LabelCreatedSheet),
  StackedBottomsheet(classType: LabelManagerSheet),
  StackedBottomsheet(classType: AddLabelsSheet),
  // @stacked-bottom-sheet
], dialogs: [
  StackedDialog(classType: InfoAlertDialog),
  // @stacked-dialog
], logger: StackedLogger())
class App {}
