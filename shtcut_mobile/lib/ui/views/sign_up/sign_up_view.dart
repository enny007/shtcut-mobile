import 'package:flutter/gestures.dart';
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
import 'package:shtcut_mobile/ui/views/sign_up/sign_up_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({super.key});

  @override
  Widget builder(
      BuildContext context, SignUpViewModel viewModel, Widget? child) {
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
                'Create Account',
                style: context.displayMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kcTextHeadingColor,
                ),
              ),
              Gap(2.h),
              Text(
                'Register Using Your Credentials',
                style: context.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(24.h),
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
                obscureText: viewModel.isPasswordObscured,
                validator: viewModel.validatePassword,
                label: 'Password',
                hintText: 'Password',
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
                children: [
                  SizedBox(
                    height: 16.h,
                    width: 16.w,
                    child: Checkbox(
                      value: viewModel.acceptedTerms,
                      onChanged: viewModel.setAcceptedTerms,
                      checkColor: kcPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      side: const BorderSide(
                        color: kcPrimaryColor,
                        width: 1.67,
                      ),
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color(0xffDCE5FB);
                        }
                        return const Color(0xffDCE5FB);
                      }),
                    ),
                  ),
                  Gap(8.w),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: context.bodySmall!.copyWith(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'I agree with ',
                            style: context.bodySmall!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: context.bodySmall!.copyWith(
                              color: kcPrimaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Terms & Conditions tap
                              },
                          ),
                          TextSpan(
                            text: ' and ',
                            style: context.bodySmall!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: context.bodySmall!.copyWith(
                              color: kcPrimaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Privacy Policy tap
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(24.h),
              AppButton(
                callback: viewModel.signUp,
                text: 'Sign Up',
                color: kcPrimaryColor,
                isDisabled: !viewModel.isValid,
                isLoading: viewModel.isBusy,
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
                    'Already have an account?',
                    style: context.bodySmall!.copyWith(
                      fontSize: 11.sp,
                    ),
                  ),
                  Gap(1.w),
                  InkWell(
                    onTap: () {
                      navRouter.navigateToSignInView();
                    },
                    child: Text(
                      'Login',
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
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(BuildContext context) {
    return SignUpViewModel();
  }
}
