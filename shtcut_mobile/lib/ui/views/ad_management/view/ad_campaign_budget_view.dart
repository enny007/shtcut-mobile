import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/ad_management/view_model/ad_campaign_budget_view_model.dart';
import 'package:stacked/stacked.dart';

class AdCampaignBudgetView extends StackedView<AdCampaignBudgetViewModel> {
  const AdCampaignBudgetView({super.key});

  @override
  Widget builder(BuildContext context, AdCampaignBudgetViewModel viewModel,
      Widget? child) {
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
                child: Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: Platform.isIOS
                      ? const Icon(
                          Icons.arrow_back_ios,
                          color: kcPrimaryColor,
                          size: 18.29,
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
          'Create Ad Budget',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
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
                      vertical: 24.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffFEFEFE),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Set your budget & duration',
                          style: context.bodyMedium!.copyWith(
                            color: const Color(0xff101828),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(2.h),
                        Text(
                          'Slide to select the budget and timeline',
                          style: context.bodySmall!.copyWith(
                            color: const Color(0xff475467),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Gap(25.h),
                        Text(
                          'Daily Budget',
                          style: context.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Gap(8.h),
                        Text(
                          '#${viewModel.dailyBudget.toInt()} per day',
                          style: context.bodyMedium!.copyWith(
                            color: const Color(0xff101828),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(12.h),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: kcPrimaryColor,
                            inactiveTrackColor: const Color(0xffE4E7EC),
                            thumbColor: kcPrimaryColor,
                            overlayColor: kcPrimaryColor.withOpacity(0.2),
                            trackHeight: 4.h,
                          ),
                          child: Slider(
                            value: viewModel.dailyBudget,
                            min: 0,
                            max: 10000,
                            divisions: 100,
                            onChanged: viewModel.updateDailyBudget,
                          ),
                        ),
                        Gap(25.h),
                        Text(
                          'Duration',
                          style: context.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Gap(8.h),
                        Text(
                          '${viewModel.duration.toInt()} days',
                          style: context.bodyMedium!.copyWith(
                            color: const Color(0xff101828),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(12.h),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: kcPrimaryColor,
                            inactiveTrackColor: const Color(0xffE4E7EC),
                            thumbColor: kcPrimaryColor,
                            overlayColor: kcPrimaryColor.withOpacity(0.2),
                            trackHeight: 4.h,
                          ),
                          child: Slider(
                            value: viewModel.duration,
                            min: 1,
                            max: 30,
                            divisions: 29,
                            onChanged: viewModel.updateDuration,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom Navigation Bar
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: const Color(0xffFEFEFE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ad Budget:',
                      style: context.bodyMedium!.copyWith(
                        color: const Color(0xff475467),
                      ),
                    ),
                    Text(
                      '#${viewModel.dailyBudget.toInt()}',
                      style: context.bodyMedium!.copyWith(
                        color: const Color(0xff101828),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gap(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Duration:',
                      style: context.bodyMedium!.copyWith(
                        color: const Color(0xff475467),
                      ),
                    ),
                    Text(
                      '${viewModel.duration.toInt()} days',
                      style: context.bodyMedium!.copyWith(
                        color: const Color(0xff101828),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gap(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated Reach:',
                      style: context.bodyMedium!.copyWith(
                        color: const Color(0xff475467),
                      ),
                    ),
                    Text(
                      '${viewModel.estimatedReach.toInt()}',
                      style: context.bodyMedium!.copyWith(
                        color: const Color(0xff101828),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gap(12.h),
                Divider(
                  color: const Color(0xffE4E7EC),
                  thickness: 1.h,
                ),
                Gap(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: context.bodyLarge!.copyWith(
                        color: const Color(0xff101828),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '#${viewModel.total.toInt()}',
                      style: context.bodyLarge!.copyWith(
                        color: const Color(0xff101828),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                AppButton(
                  callback: () {
                    viewModel.navigateToAdCampaignReviewView();
                  },
                  text: 'Next',
                  color: kcPrimaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  AdCampaignBudgetViewModel viewModelBuilder(BuildContext context) {
    return AdCampaignBudgetViewModel();
  }
}
