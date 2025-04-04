import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/all_post/all_post_view_model.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:stacked/stacked.dart';

class AllPostView extends StackedView<AllPostViewModel> {
  const AllPostView({super.key});

  @override
  Widget builder(
      BuildContext context, AllPostViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F3F8),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170.h,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 19.w,
                top: 39.h,
                bottom: 30.h,
              ),
              decoration: const BoxDecoration(
                color: kcPrimaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Posts',
                    style: context.displaySmall!.copyWith(
                      color: const Color(0xff101828),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    'Manage all your social media posts',
                    style: context.bodyMedium!.copyWith(
                      color: const Color(0xffD9D6FE),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsExtension.fromPercentage(
                  lefthorizontalPercentage: 12.w,
                  righthorizontalPercentage: 12.w,
                  topverticalPercentage: 20.h,
                  bottomverticalPercentage: 20.h,
                  context: context,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 48.h,
                      padding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 8.w,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: const Color(0xffCCCBCB),
                          width: 1.w,
                        ),
                      ),
                      child: Row(
                        children: [
                          _buildTabOption(
                            context: context,
                            title: 'Scheduled',
                            index: 0,
                            currentIndex: viewModel.currentTabIndex,
                            onTap: () => viewModel.setTabIndex(0),
                          ),
                          _buildTabOption(
                            context: context,
                            title: 'Live',
                            index: 1,
                            currentIndex: viewModel.currentTabIndex,
                            onTap: () => viewModel.setTabIndex(1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AllPostViewModel viewModelBuilder(BuildContext context) {
    return AllPostViewModel();
  }

  Widget _buildTabOption({
    required BuildContext context,
    required String title,
    required int index,
    required int currentIndex,
    required VoidCallback onTap,
  }) {
    final bool isActive = index == currentIndex;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 26.h,
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: isActive ? kcPrimaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Center(
            child: Text(
              title,
              style: context.bodySmall!.copyWith(
                color: isActive
                    ? const Color(0xffFAFAFA)
                    : const Color(0xff0A0A0B),
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
