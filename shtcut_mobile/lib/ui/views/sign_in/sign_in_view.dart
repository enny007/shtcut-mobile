import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/sign_in/sign_in_view_model.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StackedView<SignInViewModel> {
  const SignInView({super.key});

  @override
  Widget builder(
      BuildContext context, SignInViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/svgs/shtcut_logo.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsExtension.fromPercentage(
          lefthorizontalPercentage: 16.w,
          righthorizontalPercentage: 16.w,
          topverticalPercentage: 10.h,
          bottomverticalPercentage: 20.h,
          context: context,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                'Welcome back',
                style: context.displayMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kcTextHeadingColor,
                ),
              ),
              Gap(2.h),
              Text(
                'Log in to my account',
                style: context.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(24.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        controller: viewModel.emailController,
                        validator: viewModel.validateEmail,
                        label: 'Email',
                        hintText: 'Email',
                        prefixIcon: SvgPicture.asset(
                          'assets/svgs/email.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Gap(24.h),
                      AppTextField(
                        controller: viewModel.passwordController,
                        validator: viewModel.validatePassword,
                        label: 'Password',
                        hintText: 'Password',
                        obscureText: viewModel.isPasswordObscured,
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
                      Gap(12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 16.h,
                                  width: 16.w,
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (_) {},
                                    checkColor: kcPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    side: const BorderSide(
                                      color: kcPrimaryColor,
                                      width: 1.67,
                                    ),
                                    fillColor: WidgetStateProperty.resolveWith(
                                        (states) {
                                      if (states
                                          .contains(WidgetState.selected)) {
                                        return const Color(0xffDCE5FB);
                                      }
                                      return const Color(0xffDCE5FB);
                                    }),
                                  ),
                                ),
                                Gap(8.w),
                                Text(
                                  'Remember me',
                                  style: context.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              viewModel.showForgotPasswordSheet();
                            },
                            child: Text(
                              'Forgot Password?',
                              style: context.bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: kcPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(24.h),
                      AppButton(
                        callback: () {
                          viewModel.signIn();
                        },
                        text: 'Log In',
                        color: kcPrimaryColor,
                        isLoading: viewModel.isBusy,
                        isDisabled: !viewModel.isValid,
                      ),
                      Gap(22.h),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Color(0xffD0D5DD),
                              thickness: 1,
                            ),
                          ),
                          Gap(18.w),
                          Text(
                            'OR',
                            style: context.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(18.w),
                          const Expanded(
                            child: Divider(
                              color: Color(0xffD0D5DD),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      Gap(32.h),
                      AppButton(
                        callback: () {
                          viewModel.googleSignIn();
                        },
                        isLoading: viewModel.isBusy2,
                        loadingColor: kcPrimaryColor,
                        color: Colors.white,
                        textColor: kcTextColor,
                        centerWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/google.svg',
                              fit: BoxFit.scaleDown,
                            ),
                            Gap(10.w),
                            Text(
                              'Continue with Google',
                              style: context.bodyMedium!.copyWith(
                                color: const Color(0xff151314),
                              ),
                            ),
                          ],
                        ),
                        border: Border.all(
                          color: kcTextColor,
                          width: 1,
                        ),
                      ),
                      Gap(16.h),
                      AppButton(
                        callback: () {},
                        color: Colors.white,
                        textColor: kcTextColor,
                        centerWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/Apple Logo.svg',
                              fit: BoxFit.scaleDown,
                            ),
                            Gap(10.w),
                            Text(
                              'Continue with Apple',
                              style: context.bodyMedium!.copyWith(
                                color: const Color(0xff151314),
                              ),
                            ),
                          ],
                        ),
                        border: Border.all(
                          color: kcTextColor,
                          width: 1,
                        ),
                      ),
                      Gap(22.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: context.bodySmall!.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                          Gap(1.w),
                          InkWell(
                            onTap: () {
                              navRouter.navigateToSignUpView();
                            },
                            child: Text(
                              'Sign Up',
                              style: context.bodySmall!.copyWith(
                                color: kcPrimaryColor,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignInViewModel viewModelBuilder(BuildContext context) {
    return SignInViewModel();
  }
}
