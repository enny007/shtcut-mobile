import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/user_profile/view_models/change_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ChangePasswordView extends StackedView<ChangePasswordViewModel> {
  const ChangePasswordView({super.key});

  @override
  Widget builder(
      BuildContext context, ChangePasswordViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F3F8),
      appBar: AppBar(
        backgroundColor: const Color(0xffFEFEFE),
        toolbarHeight: 60.h,
        elevation: 0,
        leadingWidth: 71.w,
        leading: Row(
          children: [
            Gap(10.w),
            GestureDetector(
              onTap: () => navRouter.back(),
              child: Container(
                height: 32.h,
                width: 32.w,
                decoration: const BoxDecoration(
                  color: Color(0xffDCE5FB),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Platform.isIOS
                      ? Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: kcPrimaryColor,
                            size: 18.29,
                          ),
                        )
                      : const Icon(
                          Icons.arrow_back,
                          color: kcPrimaryColor,
                          size: 18.29,
                        ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: Text(
          'Change Password',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsExtension.fromPercentage(
          lefthorizontalPercentage: 15.w,
          righthorizontalPercentage: 15.w,
          topverticalPercentage: 20.h,
          bottomverticalPercentage: 20.h,
          context: context,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 24.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFEFEFE),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change Password Form',
                    style: context.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(2.h),
                  Text(
                    'Fill information to change your password',
                    style: context.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff667085),
                    ),
                  ),
                  Gap(12.h),
                  AppTextField(
                    controller: viewModel.currentPasswordController,
                    validator: viewModel.validateCurrentPassword,
                    label: 'Current Password',
                    hintText: 'Enter your current password',
                    obscureText: viewModel.isCurrentPasswordObscured,
                    prefixIcon: SvgPicture.asset(
                      'assets/svgs/finger-scan.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    suffixIcon: IconButton(
                      onPressed: viewModel.toggleCurrentPasswordVisibility,
                      icon: viewModel.isCurrentPasswordObscured
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
                  Gap(16.h),

                  // New Password Field
                  AppTextField(
                    controller: viewModel.newPasswordController,
                    validator: viewModel.validateNewPassword,
                    label: 'New Password',
                    hintText: 'Enter your new password',
                    obscureText: viewModel.isNewPasswordObscured,
                    prefixIcon: SvgPicture.asset(
                      'assets/svgs/finger-scan.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    suffixIcon: IconButton(
                      onPressed: viewModel.toggleNewPasswordVisibility,
                      icon: viewModel.isNewPasswordObscured
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
                  Gap(16.h),

                  // Confirm New Password Field
                  AppTextField(
                    controller: viewModel.confirmNewPasswordController,
                    validator: viewModel.validateConfirmPassword,
                    label: 'Confirm New Password',
                    hintText: 'Confirm your new password',
                    obscureText: viewModel.isConfirmPasswordObscured,
                    prefixIcon: SvgPicture.asset(
                      'assets/svgs/finger-scan.svg',
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: AppButton(
          callback: () {
            viewModel.showUpdatePasswordSheet();
          },
          text: 'Update Password',
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(BuildContext context) {
    return ChangePasswordViewModel();
  }
}
