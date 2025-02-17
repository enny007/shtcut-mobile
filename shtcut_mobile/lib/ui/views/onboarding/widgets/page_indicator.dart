import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/views/onboarding/onboarding_view_model.dart';
import 'package:stacked/stacked.dart';

class PageIndicator extends ViewModelWidget<OnboardingViewModel> {
  final int count;
  final int currentIndex;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, OnboardingViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: 20.w,
          height: 4.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: currentIndex == index
                ? kcPrimaryColor
                : const Color(0xff2475F5).withValues(alpha: 0.2),
          ),
        ),
      ),
    );
  }
}
