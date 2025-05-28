import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/reports/reports_view_model.dart';
import 'package:shtcut_mobile/ui/views/reports/widgets/reports_tile.dart';
import 'package:stacked/stacked.dart';

class ReportsView extends StackedView<ReportsViewModel> {
  const ReportsView({super.key});

  @override
  Widget builder(
      BuildContext context, ReportsViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F3F8),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180.h,
            padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
              top: 30.h,
              bottom: 10.h,
            ),
            decoration: BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Reports',
                      style: context.displayLarge!.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Gap(3.h),
                    Text(
                      'Monitor engagement across platforms',
                      style: context.bodyMedium!.copyWith(
                        color: const Color(0xffD9D6FE),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/security_image.png',
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
          ),
          Gap(9.h),
          Row(
            children: [
              AppTextField(
                controller: viewModel.searchController,
                validator: (_) {
                  return null;
                },
                prefixIcon: SvgPicture.asset(
                  'assets/svgs/search.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Gap(7.w),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffE3E3E3),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/svgs/report_filter.svg',
                ),
              ),
              Gap(16.h),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: viewModel.reports.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(9.h);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final report = viewModel.reports[index];
                    return ReportsTile(
                      profileImagePath: report['profileImage'] ??
                          'assets/images/default_profile.png',
                      socialMediaIcon: report['socialMediaIcon'] ??
                          'assets/svgs/twitter.svg',
                      userName: report['userName'] ?? 'Unknown User',
                      actionText: report['actionText'] ?? 'posted',
                      postContent: report['postContent'] ?? '',
                      timeAgo: report['timeAgo'] ?? '0 mins',
                      onLike: () {
                        // Handle like action
                      },
                      onReplySubmit: (String reply) {
                        // Handle reply submission
                        viewModel.submitReply(index, reply);
                      },
                      onShare: () {
                        // Handle share action
                      },
                      onTag: () {
                        // Handle tag action
                      },
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
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
            // viewModel.navigateToCreateAdCampaign();
          },
          text: 'Create New Ad',
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  @override
  ReportsViewModel viewModelBuilder(BuildContext context) {
    return ReportsViewModel();
  }
}
