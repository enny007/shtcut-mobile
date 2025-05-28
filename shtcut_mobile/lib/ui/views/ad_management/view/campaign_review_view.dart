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
import 'package:shtcut_mobile/ui/views/ad_management/view_model/campaign_review_view_model.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/adaptable_icon.dart';
import 'package:stacked/stacked.dart';

class CampaignReviewView extends StackedView<CampaignReviewViewModel> {
  const CampaignReviewView({super.key});

  @override
  Widget builder(
      BuildContext context, CampaignReviewViewModel viewModel, Widget? child) {
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
          'Campaign Review',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsExtension.fromPercentage(
          lefthorizontalPercentage: 12.w,
          righthorizontalPercentage: 12.w,
          topverticalPercentage: 20.h,
          bottomverticalPercentage: 20.h,
          context: context,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 24.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Campaign Overview',
                  style: context.bodyMedium!.copyWith(
                    color: const Color(0xff101828),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(16.h),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xffF9FAFB),
                    border: Border.all(
                      color: const Color(0xffEAECF0),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2.05.r),
                        child: Image.asset(
                          'assets/images/pic_1.png',
                          width: 54.w,
                          height: 59.h,
                        ),
                      ),
                      Gap(8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 220.w,
                                child: Text(
                                  'We built Safari to be the best browser for your Mac, iPhone  and enjoy the goodness of life....',
                                  style: context.bodySmall!.copyWith(
                                    color: const Color(0xff2B2B2B),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                size: 24,
                                color: Color(0xff726C6C),
                              ),
                            ],
                          ),
                          const AdaptableIcon(
                            size: 28,
                            showBorder: true,
                            borderColor: kcPrimaryColor,
                            borderWidth: 1,
                            icons: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/pic_2.png'),
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/pic_2.png'),
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/pic_2.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Campaign Goal',
                        style: context.bodySmall!.copyWith(
                            color: const Color(0xff2B2B2B),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Edit',
                          style: context.bodySmall!.copyWith(
                              color: kcPrimaryColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Gap(4.w),
                        SvgPicture.asset(
                          'assets/svgs/edit.svg',
                        ),
                      ],
                    )
                  ],
                ),
                AppTextField(
                  controller: viewModel.campaignGoalController,
                  validator: (_) {
                    return null;
                  },
                ),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Audience',
                        style: context.bodySmall!.copyWith(
                            color: const Color(0xff2B2B2B),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Edit',
                          style: context.bodySmall!.copyWith(
                              color: kcPrimaryColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Gap(4.w),
                        SvgPicture.asset(
                          'assets/svgs/edit.svg',
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF9FAFB),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: const Color(0xffEAECF0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All Countries',
                        style: context.bodySmall!.copyWith(
                          color: const Color(0xff2B2829),
                        ),
                      ),
                      Gap(12.h),
                      const Divider(
                        color: Color(0xffE3E3E3),
                      ),
                      Gap(12.h),
                      Text(
                        'Male &',
                        style: context.bodySmall!.copyWith(
                          color: const Color(0xff2B2829),
                        ),
                      ),
                      Gap(12.h),
                      const Divider(
                        color: Color(0xffE3E3E3),
                      ),
                      Gap(12.h),
                      Text(
                        'Cooking-Bake-Cake-Birthday',
                        style: context.bodySmall!.copyWith(
                          color: kcPrimaryColor,
                        ),
                      ),
                      Gap(12.h),
                    ],
                  ),
                ),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Budget & Duration',
                        style: context.bodySmall!.copyWith(
                            color: const Color(0xff2B2B2B),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Edit',
                          style: context.bodySmall!.copyWith(
                              color: kcPrimaryColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Gap(4.w),
                        SvgPicture.asset(
                          'assets/svgs/edit.svg',
                        ),
                      ],
                    ),
                  ],
                ),
                AppTextField(
                  controller: viewModel.budgetController,
                  validator: (_) {
                    return null;
                  },
                ),
              ],
            ),
          ),
        ]),
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
          text: 'Proceed',
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  @override
  CampaignReviewViewModel viewModelBuilder(BuildContext context) {
    return CampaignReviewViewModel();
  }
}
