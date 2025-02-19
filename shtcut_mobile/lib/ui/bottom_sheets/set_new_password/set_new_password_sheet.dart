import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/set_new_password/set_new_password_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetNewPasswordSheet extends StackedView<SetNewPasswordModel> {
  const SetNewPasswordSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(
      BuildContext context, SetNewPasswordModel viewModel, Widget? child) {
    return SheetWidget(
      height: 500.h,
      icon: SvgPicture.asset('assets/svgs/password_icon.svg'),
      children: [
        Text(
          'Set a New Password',
          style: context.displaySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: kcPrimaryTextColor,
          ),
        ),
        Gap(16.h),
        Text(
          'Please set a new password to secure your Work Mate account.',
          style: context.bodySmall!.copyWith(
            color: kcSubHeadingColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        AppTextField(
          controller: TextEditingController(),
          validator: (value) {
            return null;
          },
          label: 'Password',
          isPassword: viewModel.isPasswordObscured,
          prefixIcon: SvgPicture.asset(
            'assets/svgs/password_lock.svg',
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: IconButton(
            onPressed: viewModel.togglePasswordVisibility,
            icon: viewModel.isPasswordObscured
                ? const Icon(
                    Icons.visibility_off,
                    color: kcPrimaryColor,
                    size: 20,
                  )
                : const Icon(
                    Icons.visibility,
                    color: kcPrimaryColor,
                    size: 20,
                  ),
          ),
        ),
        Gap(24.h),
        AppTextField(
          controller: TextEditingController(),
          validator: (value) {
            return null;
          },
          label: 'Confirm Password',
          isPassword: viewModel.isConfirmPasswordObscured,
          prefixIcon: SvgPicture.asset(
            'assets/svgs/password_lock.svg',
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: IconButton(
            onPressed: viewModel.toggleConfirmPasswordVisibility,
            icon: viewModel.isConfirmPasswordObscured
                ? const Icon(
                    Icons.visibility_off,
                    color: kcPrimaryColor,
                    size: 20,
                  )
                : const Icon(
                    Icons.visibility,
                    color: kcPrimaryColor,
                    size: 20,
                  ),
          ),
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
  SetNewPasswordModel viewModelBuilder(BuildContext context) {
    return SetNewPasswordModel();
  }
}
