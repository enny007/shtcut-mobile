// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/action_sheet/action_sheet.dart';
import '../ui/bottom_sheets/add_hashtag/add_hashtag_sheet.dart';
import '../ui/bottom_sheets/add_hashtag/hashtag_created_sheet.dart';
import '../ui/bottom_sheets/add_labels/add_labels_sheet.dart';
import '../ui/bottom_sheets/email_verification/email_verification_sheet.dart';
import '../ui/bottom_sheets/forgot_password/forgot_password_otp_sheet.dart';
import '../ui/bottom_sheets/forgot_password/forgot_password_sheet.dart';
import '../ui/bottom_sheets/hashtag/hashtag_sheet.dart';
import '../ui/bottom_sheets/label_created/label_created_sheet.dart';
import '../ui/bottom_sheets/label_manager/label_manager_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/password_confirmation/password_confirmation_sheet.dart';
import '../ui/bottom_sheets/permission_sheet/permission_sheet.dart';
import '../ui/bottom_sheets/publish_post/publish_post_sheet.dart';
import '../ui/bottom_sheets/schedule_post/schedule_post_sheet.dart';
import '../ui/bottom_sheets/set_new_password/set_new_password_sheet.dart';
import '../ui/bottom_sheets/welcome/welcome_sheet.dart';

enum BottomSheetType {
  notice,
  forgotPassword,
  forgotPasswordOtp,
  welcome,
  emailVerification,
  setNewPassword,
  passwordConfirmation,
  action,
  permission,
  hashtagCreated,
  addHashtag,
  hashtag,
  labelCreated,
  labelManager,
  addLabels,
  schedulePost,
  publishPost,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.forgotPassword: (context, request, completer) =>
        ForgotPasswordSheet(request: request, completer: completer),
    BottomSheetType.forgotPasswordOtp: (context, request, completer) =>
        ForgotPasswordOtpSheet(request: request, completer: completer),
    BottomSheetType.welcome: (context, request, completer) =>
        WelcomeSheet(request: request, completer: completer),
    BottomSheetType.emailVerification: (context, request, completer) =>
        EmailVerificationSheet(request: request, completer: completer),
    BottomSheetType.setNewPassword: (context, request, completer) =>
        SetNewPasswordSheet(request: request, completer: completer),
    BottomSheetType.passwordConfirmation: (context, request, completer) =>
        PasswordConfirmationSheet(request: request, completer: completer),
    BottomSheetType.action: (context, request, completer) =>
        ActionSheet(request: request, completer: completer),
    BottomSheetType.permission: (context, request, completer) =>
        PermissionSheet(request: request, completer: completer),
    BottomSheetType.hashtagCreated: (context, request, completer) =>
        HashtagCreatedSheet(request: request, completer: completer),
    BottomSheetType.addHashtag: (context, request, completer) =>
        AddHashtagSheet(request: request, completer: completer),
    BottomSheetType.hashtag: (context, request, completer) =>
        HashtagSheet(request: request, completer: completer),
    BottomSheetType.labelCreated: (context, request, completer) =>
        LabelCreatedSheet(request: request, completer: completer),
    BottomSheetType.labelManager: (context, request, completer) =>
        LabelManagerSheet(request: request, completer: completer),
    BottomSheetType.addLabels: (context, request, completer) =>
        AddLabelsSheet(request: request, completer: completer),
    BottomSheetType.schedulePost: (context, request, completer) =>
        SchedulePostSheet(request: request, completer: completer),
    BottomSheetType.publishPost: (context, request, completer) =>
        PublishPostSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
