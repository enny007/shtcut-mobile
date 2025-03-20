import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/forgot_password/forgot_password_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordSheet extends StackedView<ForgotPasswordModel> {
  const ForgotPasswordSheet({
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
          'Reset password code will be sent to your email to reset your password.',
          style: context.bodySmall!.copyWith(
            color: kcSubHeadingColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        AppTextField(
          controller: viewModel.emailController,
          validator: viewModel.validateEmail,
          label: 'Email',
          prefixIcon: SvgPicture.asset(
            'assets/svgs/email.svg',
            fit: BoxFit.scaleDown,
          ),
          hintText: 'My Email',
        ),
        Gap(32.h),
        AppButton(
          text: 'Send Verification Code',
          callback: () {
            viewModel.sendPasswordResetCode();
          },
          color: kcPrimaryColor,
          isLoading: viewModel.isBusy,
          isDisabled: !viewModel.isValid,
        ),
      ],
    );
  }

  @override
  ForgotPasswordModel viewModelBuilder(BuildContext context) {
    return ForgotPasswordModel(completer);
  }
}
