// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/action_sheet/action_sheet.dart';
import '../ui/bottom_sheets/ad_select_post/ad_select_post_sheet.dart';
import '../ui/bottom_sheets/add_hashtag/add_hashtag_sheet.dart';
import '../ui/bottom_sheets/add_hashtag/hashtag_created_sheet.dart';
import '../ui/bottom_sheets/add_labels/add_labels_sheet.dart';
import '../ui/bottom_sheets/create_media_folder/create_media_folder_sheet.dart';
import '../ui/bottom_sheets/create_new_task/create_new_task_sheet.dart';
import '../ui/bottom_sheets/custom_location/custom_location_sheet.dart';
import '../ui/bottom_sheets/email_verification/email_verification_sheet.dart';
import '../ui/bottom_sheets/forgot_password/forgot_password_otp_sheet.dart';
import '../ui/bottom_sheets/forgot_password/forgot_password_sheet.dart';
import '../ui/bottom_sheets/group_profile_picture/group_profile_picture_sheet.dart';
import '../ui/bottom_sheets/hashtag/hashtag_sheet.dart';
import '../ui/bottom_sheets/label_created/label_created_sheet.dart';
import '../ui/bottom_sheets/label_manager/label_manager_sheet.dart';
import '../ui/bottom_sheets/manage_library/manage_library_sheet.dart';
import '../ui/bottom_sheets/media_upload/media_upload_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/password_confirmation/password_confirmation_sheet.dart';
import '../ui/bottom_sheets/permission_sheet/permission_sheet.dart';
import '../ui/bottom_sheets/post_publish/post_publish_sheet.dart';
import '../ui/bottom_sheets/publish_post/publish_post_sheet.dart';
import '../ui/bottom_sheets/report_filter/report_filter_sheet.dart';
import '../ui/bottom_sheets/schedule_post/schedule_post_sheet.dart';
import '../ui/bottom_sheets/set_new_password/set_new_password_sheet.dart';
import '../ui/bottom_sheets/task_created/task_created_sheet.dart';
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
  postPublish,
  manageLibrary,
  mediaUpload,
  createMediaFolder,
  createNewTask,
  taskCreated,
  groupProfilePicture,
  customLocation,
  adSelectPost,
  reportFilter,
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
    BottomSheetType.postPublish: (context, request, completer) =>
        PostPublishSheet(request: request, completer: completer),
    BottomSheetType.manageLibrary: (context, request, completer) =>
        ManageLibrarySheet(request: request, completer: completer),
    BottomSheetType.mediaUpload: (context, request, completer) =>
        MediaUploadSheet(request: request, completer: completer),
    BottomSheetType.createMediaFolder: (context, request, completer) =>
        CreateMediaFolderSheet(request: request, completer: completer),
    BottomSheetType.createNewTask: (context, request, completer) =>
        CreateNewTaskSheet(request: request, completer: completer),
    BottomSheetType.taskCreated: (context, request, completer) =>
        TaskCreatedSheet(request: request, completer: completer),
    BottomSheetType.groupProfilePicture: (context, request, completer) =>
        GroupProfilePictureSheet(request: request, completer: completer),
    BottomSheetType.customLocation: (context, request, completer) =>
        CustomLocationSheet(request: request, completer: completer),
    BottomSheetType.adSelectPost: (context, request, completer) =>
        AdSelectPostSheet(request: request, completer: completer),
    BottomSheetType.reportFilter: (context, request, completer) =>
        ReportFilterSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
