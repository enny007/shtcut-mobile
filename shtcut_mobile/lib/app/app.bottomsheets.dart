// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/email_verification/email_verification_sheet.dart';
import '../ui/bottom_sheets/forgot_password/forgot_password_otp_sheet.dart';
import '../ui/bottom_sheets/forgot_password/forgot_password_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/password_confirmation/password_confirmation_sheet.dart';
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
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
