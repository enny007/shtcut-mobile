// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/email_verification/email_verification_sheet.dart';
import '../ui/bottom_sheets/forgot_password/forgot_password_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/welcome/welcome_sheet.dart';

enum BottomSheetType {
  notice,
  forgotPassword,
  welcome,
  emailVerification,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.forgotPassword: (context, request, completer) =>
        ForgotPasswordSheet(request: request, completer: completer),
    BottomSheetType.welcome: (context, request, completer) =>
        WelcomeSheet(request: request, completer: completer),
    BottomSheetType.emailVerification: (context, request, completer) =>
        EmailVerificationSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
