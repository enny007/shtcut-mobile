import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/forgot_password/forgot_password_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/otp_box.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordOtpSheet extends StackedView<ForgotPasswordModel> {
  const ForgotPasswordOtpSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(
      BuildContext context, ForgotPasswordModel viewModel, Widget? child) {
    return SheetWidget(
      icon: SvgPicture.asset('assets/svgs/password_icon.svg'),
      children: [
        Text(
          'Forgot Password',
          style: context.displaySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: kcPrimaryTextColor,
          ),
        ),
        Gap(16.h),
        Text(
          'Enter reset password code sent to your email',
          style: context.bodySmall!.copyWith(
            color: kcSubHeadingColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(12.h),
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
            Gap(1.w),
            Text(
              'Resend it',
              style: context.bodySmall!.copyWith(
                color: kcPrimaryColor,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
        Gap(32.h),
        AppButton(
          text: 'Submit',
          callback: () {
            completer!(SheetResponse(confirmed: true));
          },
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  ForgotPasswordModel viewModelBuilder(BuildContext context) {
    return ForgotPasswordModel();
  }
}
