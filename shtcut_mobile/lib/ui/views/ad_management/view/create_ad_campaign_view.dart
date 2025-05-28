import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/ad_management/view_model/create_ad_campaign_view_model.dart';
import 'package:shtcut_mobile/ui/views/connect_accounts/widgets/account_tile.dart';
import 'package:shtcut_mobile/ui/views/create_post/widgets/collapsible_account_tile.dart';
import 'package:shtcut_mobile/ui/views/create_post/widgets/connect_account_tile.dart';
import 'package:stacked/stacked.dart';

class CreateAdCampaignView extends StackedView<CreateAdCampaignViewModel> {
  const CreateAdCampaignView({super.key});

  @override
  Widget builder(BuildContext context, CreateAdCampaignViewModel viewModel,
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
          'Create Ad Campaign',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsExtension.fromPercentage(
            lefthorizontalPercentage: 12.w,
            righthorizontalPercentage: 12.w,
            topverticalPercentage: 20.h,
            bottomverticalPercentage: 20.h,
            context: context,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 15.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Social media',
                        style: context.bodyMedium!.copyWith(
                          color: const Color(0xff101828),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(2.h),
                      Text(
                        'Select the social media platforms you want to post to',
                        style: context.bodySmall!.copyWith(
                          color: const Color(0xff475467),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Gap(21.h),
                    ],
                  ),
                ),

                // Social media accounts list
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: Column(
                    children: [
                      const AccountTile(
                        svgPath: 'assets/svgs/instagram_logo.svg',
                        title: 'Instagram',
                      ),
                      Gap(14.h),
                      CollapsibleAccountTile(
                        svgPath: 'assets/svgs/x_logo.svg',
                        title: 'Twitter',
                        children: [
                          CheckableAccountTile(
                            imagePath: 'assets/images/x_dummy.png',
                            title: 'Account 1',
                            onChanged: (value) {},
                          ),
                          Gap(10.h),
                          CheckableAccountTile(
                            imagePath: 'assets/images/x_dummy.png',
                            title: 'Account 2',
                            onChanged: (value) {},
                          ),
                          Gap(10.h),
                          CheckableAccountTile(
                            imagePath: 'assets/images/x_dummy.png',
                            title: 'Account 3',
                            onChanged: (value) {},
                          ),
                          Gap(10.h),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16.w,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_circle_outline,
                                  size: 22,
                                  color: kcPrimaryColor,
                                ),
                                Gap(6.w),
                                Text(
                                  'Connect Account',
                                  style: context.bodySmall!.copyWith(
                                    color: kcPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(27.h),
                        ],
                      ),
                      Gap(14.h),
                      const CollapsibleAccountTile(
                        svgPath: 'assets/svgs/facebook_logo.svg',
                        title: 'Facebook',
                        children: [],
                      ),
                      Gap(14.h),
                      const CollapsibleAccountTile(
                        svgPath: 'assets/svgs/tiktok_logo.svg',
                        title: 'Tiktok',
                        children: [],
                      ),
                      Gap(14.h),
                      const CollapsibleAccountTile(
                        svgPath: 'assets/svgs/youtube_logo.svg',
                        title: 'Youtube',
                        children: [],
                      ),
                      Gap(14.h),
                      const CollapsibleAccountTile(
                        svgPath: 'assets/svgs/linkedin_logo.svg',
                        title: 'LinkedIn',
                        children: [],
                      ),
                      Gap(14.h),
                      const CollapsibleAccountTile(
                        svgPath: 'assets/svgs/pinterest_logo.svg',
                        title: 'Pinterest',
                        children: [],
                      ),
                      Gap(14.h),
                      const CollapsibleAccountTile(
                        svgPath: 'assets/svgs/threads_logo.svg',
                        title: 'Threads',
                        children: [],
                      ),
                      // Add padding at the bottom to ensure content is scrollable
                      Gap(30.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
            viewModel.navigateToCampaignGoal();
          },
          text: 'Next',
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  @override
  CreateAdCampaignViewModel viewModelBuilder(BuildContext context) {
    return CreateAdCampaignViewModel();
  }
}
