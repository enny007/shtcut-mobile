import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/email_verification/email_verification_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/loader.dart';
import 'package:shtcut_mobile/ui/global_widgets/otp_box.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailVerificationSheet extends StackedView<EmailVerificationModel> {
  const EmailVerificationSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(
      BuildContext context, EmailVerificationModel viewModel, Widget? child) {
    final email = request.data as String;
    return SheetWidget(
      icon: SvgPicture.asset('assets/svgs/email_verification.svg'),
      height: 380.h,
      children: [
        Text(
          'Email Verification Sent!',
          style: context.displaySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: kcPrimaryTextColor,
          ),
        ),
        Gap(16.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: context.bodySmall!.copyWith(
              color: kcSubHeadingColor,
            ),
            children: [
              const TextSpan(
                text: 'A verification code will be sent to the email ',
              ),
              TextSpan(
                text: email,
                style: context.bodyMedium!.copyWith(
                  color: kcPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextSpan(
                text: ' for your account verification process',
              ),
            ],
          ),
        ),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            6,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: OtpBox(
                textColor: Colors.black,
                fillColor: const Color(0xffFEFEFE),
                controller: viewModel.controllers[index],
                focusNode: viewModel.focusNodes[index],
                onChanged: (value) {
                  if (value.length == 1) {
                    viewModel.handleOtpInput(value, index, context);
                  } else if (value.isEmpty) {
                    viewModel.handleBackspace(index, context);
                  }
                },
              ),
            ),
          ),
        ),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Have\'nt received the verification code?',
              style: context.bodySmall!.copyWith(
                fontSize: 11.sp,
              ),
            ),
            Gap(3.w),
            viewModel.resendCountdown > 0
                ? Text(
                    'Resend in (${viewModel.resendCountdown})',
                    style: context.bodySmall!.copyWith(
                      color: kcSubHeadingColor,
                      fontSize: 11.sp,
                    ),
                  )
                : InkWell(
                    onTap: viewModel.isBusy2
                        ? null
                        : () {
                            viewModel.resendOtp();
                          },
                    child: viewModel.isBusy2
                        ? const BouncingDotsLoader(
                            color: kcPrimaryColor,
                          )
                        : Text(
                            'Resend Code',
                            style: context.bodySmall!.copyWith(
                              color: kcPrimaryColor,
                              fontSize: 11.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                  ),
          ],
        ),
        Gap(32.h),
        AppButton(
          text: 'Confirm Code',
          callback: () {
            viewModel.verifyOtp();
          },
          color: kcPrimaryColor,
          isDisabled: !viewModel.isOtpComplete,
          isLoading: viewModel.isBusy,
        ),
      ],
    );
  }

  @override
  EmailVerificationModel viewModelBuilder(BuildContext context) {
    final email = request.data as String;
    return EmailVerificationModel()
      ..initialize(
        userEmail: email,
        completer: completer!,
      );
  }
}
