import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/onboarding/onboarding_view_model.dart';
import 'package:shtcut_mobile/ui/views/onboarding/widgets/page_indicator.dart';
import 'package:stacked/stacked.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget builder(
      BuildContext context, OnboardingViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 0.1),
            stops: [0.018, 1.0],
            colors: [
              kcPrimaryColor,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 40.h,
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: viewModel.pageController,
                    itemCount: viewModel.onboardingData.length,
                    onPageChanged: viewModel.setPage,
                    itemBuilder: (context, index) {
                      final data = viewModel.onboardingData[index];
                      return Column(
                        children: [
                          Gap(89.h),
                          Image.asset(
                            data['image']!,
                            height: 436.h,
                            width: 314.w,
                            // color: Colors.transparent,
                            // fit: BoxFit.scaleDown,
                          ),
                          Gap(15.h),
                          Text(
                            data['title']!,
                            style: context.displaySmall!.copyWith(
                              color: kcTextHeadingColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 28.sp,
                            ),
                          ),
                          Gap(12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 31.w,
                            ),
                            child: Text(
                              data['description']!,
                              style: context.bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Gap(32.h),
                          PageIndicator(
                            count: viewModel.onboardingData.length,
                            currentIndex: index,
                          ),
                          Gap(32.h),
                        ],
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: AppButton(
                  callback: () {
                    viewModel.nextPage();
                  },
                  text: viewModel.currentPage ==
                          viewModel.onboardingData.length - 1
                      ? 'Create an Account'
                      : 'Next',
                  color: kcPrimaryColor,
                ),
              ),
              Gap(16.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: AppButton(
                  callback: () {
                    viewModel.currentPage == 3
                        ? () {}
                        : viewModel.skipOnboarding();
                  },
                  text: viewModel.currentPage ==
                          viewModel.onboardingData.length - 1
                      ? 'Log In'
                      : 'Skip',
                  textColor: kcPrimaryColor,
                  border: Border.all(
                    color: kcPrimaryColor,
                    width: 2.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(BuildContext context) {
    return OnboardingViewModel();
  }
}
