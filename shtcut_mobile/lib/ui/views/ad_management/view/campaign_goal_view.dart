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
import 'package:shtcut_mobile/ui/views/ad_management/view_model/campaign_goal_view_model.dart';
import 'package:shtcut_mobile/ui/views/ad_management/widgets/campaign_tile.dart';
import 'package:shtcut_mobile/ui/views/content_preview/widget/social_profile_container.dart';
import 'package:stacked/stacked.dart';

class CampaignGoalView extends StackedView<CampaignGoalViewModel> {
  const CampaignGoalView({super.key});

  @override
  Widget builder(
      BuildContext context, CampaignGoalViewModel viewModel, Widget? child) {
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
          'Create Ad Campaign Goal',
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SocialProfilesContainer(
                selectedPlatforms: viewModel.selectedSocialTypes,
                onPlatformSelected: (platformId) {
                  viewModel.toggleSocialPlatform(platformId);
                },
                onAddProfile: () {
                  // Handle add profile action
                },
              ),
              Gap(14.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Campaign Name',
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Gap(0.h),
                    AppTextField(
                      controller: viewModel.campaignController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a campaign name';
                        }
                        return null;
                      },
                      hintText: 'Enter Title',
                    ),
                  ],
                ),
              ),
              Gap(14.h),
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
                      'Choose your campaign goal',
                      style: context.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(16.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.campaignContent.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Gap(8.h);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CampaignTile(
                          onTap: () {
                            // viewModel.onCampaignContentTap(index);
                          },
                          leadingIconPath: viewModel.campaignContent[index]
                              ['leadingIconPath'],
                          title: viewModel.campaignContent[index]['title'],
                          subtitle: viewModel.campaignContent[index]
                              ['subtitle'],
                        );
                      },
                    ),
                    // Gap(14.h),
                  ],
                ),
              ),
              Gap(14.h),
              Container(
                width: double.infinity,
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
                      'Define who should see your Ads',
                      style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Gap(2.h),
                    Text(
                      'Provide the name of the Campaign to proceed',
                      style: context.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff667085),
                      ),
                    ),
                    Gap(16.h),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xffFEFEFE),
                        border: Border.all(
                          color: const Color(0xffCCCBCB),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location Targeting',
                            style: context.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Gap(2.h),
                          Text(
                            'Select locations for this campaign',
                            style: context.bodySmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff667085),
                            ),
                          ),
                          Gap(16.h),
                          _buildLocationOption(
                            context,
                            viewModel,
                            'all',
                            'All Countries',
                          ),
                          Gap(12.h),
                          _buildLocationOption(
                            context,
                            viewModel,
                            'nigeria',
                            'Nigeria',
                          ),
                          Gap(12.h),
                          _buildLocationOption(
                            context,
                            viewModel,
                            'custom',
                            'Custom Locations',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffFEFEFE),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: const Color(0xffCCCBCB),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Demographics',
                      style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Gap(2.h),
                    Text(
                      'Select the age and gender you want to view this ad',
                      style: context.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff667085),
                      ),
                    ),
                    //
                    Gap(16.h),
                    GestureDetector(
                      onTap: viewModel.toggleAgeRangeDropdown,
                      child: Container(
                        height: 44.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: const Color(0xff98A2B3),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff101828)
                                  .withValues(alpha: 0.05),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/user-octagon.svg', // Replace with appropriate age icon
                              fit: BoxFit.scaleDown,
                            ),
                            Gap(8.w),
                            Expanded(
                              child: Text(
                                viewModel.selectedAgeRangeText,
                                style: context.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: viewModel.selectedAgeRanges.values
                                          .any((selected) => selected)
                                      ? const Color(0xff344054)
                                      : const Color(0xff98A2B3),
                                ),
                              ),
                            ),
                            Icon(
                              viewModel.isAgeRangeDropdownOpen
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: kcPrimaryColor,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (viewModel.isAgeRangeDropdownOpen) ...[
                      Gap(8.h),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: const Color(0xff98A2B3),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff101828)
                                  .withValues(alpha: 0.05),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children:
                              viewModel.selectedAgeRanges.keys.map((ageRange) {
                            return CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                ageRange,
                                style: context.bodyMedium!.copyWith(
                                  color: const Color(0xff344054),
                                ),
                              ),
                              value: viewModel.selectedAgeRanges[ageRange],
                              onChanged: (bool? value) {
                                viewModel.toggleAgeRangeSelection(ageRange);
                              },
                              activeColor: kcPrimaryColor,
                              controlAffinity: ListTileControlAffinity.leading,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                    Gap(16.h),
                    GestureDetector(
                      onTap: viewModel.toggleGenderDropdown,
                      child: Container(
                        height: 44.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: const Color(0xff98A2B3),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff101828)
                                  .withValues(alpha: 0.05),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/user-octagon.svg', // Replace with appropriate gender icon
                              fit: BoxFit.scaleDown,
                            ),
                            Gap(8.w),
                            Expanded(
                              child: Text(
                                viewModel.selectedGenderText,
                                style: context.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: viewModel.selectedGenders.values
                                          .any((selected) => selected)
                                      ? const Color(0xff344054)
                                      : const Color(0xff98A2B3),
                                ),
                              ),
                            ),
                            Icon(
                              viewModel.isGenderDropdownOpen
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: kcPrimaryColor,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (viewModel.isGenderDropdownOpen) ...[
                      Gap(8.h),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: const Color(0xff98A2B3),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff101828)
                                  .withValues(alpha: 0.05),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children:
                              viewModel.selectedGenders.keys.map((gender) {
                            return CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                gender,
                                style: context.bodyMedium!.copyWith(
                                  color: const Color(0xff344054),
                                ),
                              ),
                              value: viewModel.selectedGenders[gender],
                              onChanged: (bool? value) {
                                viewModel.toggleGenderSelection(gender);
                              },
                              activeColor: kcPrimaryColor,
                              controlAffinity: ListTileControlAffinity.leading,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Gap(16.h),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffFEFEFE),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: const Color(0xffCCCBCB),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Interests',
                      style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Gap(2.h),
                    Text(
                      'What are some words people use when searching for your products',
                      style: context.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff667085),
                      ),
                    ),
                    Gap(16.h),
                    AppTextField(
                      controller: viewModel.interestController,
                      validator: (_) {
                        return null;
                      },
                      maxLines: 4,
                      hintText: 'Text Area',
                    ),
                    Text(
                      'Search up to 25 words',
                      style: context.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff98A2B3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
            viewModel.navigateToCreatePost();
          },
          text: 'Next',
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  @override
  CampaignGoalViewModel viewModelBuilder(BuildContext context) {
    return CampaignGoalViewModel();
  }

  Widget _buildLocationOption(
    BuildContext context,
    CampaignGoalViewModel viewModel,
    String value,
    String title,
  ) {
    return GestureDetector(
      onTap: () {
        viewModel.setLocationOption(value);
        if (value == 'custom') {
          viewModel.showCustomLocationBottomSheet();
        }
      },
      child: Row(
        children: [
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: Radio<String>(
              value: value,
              groupValue: viewModel.selectedLocationOption,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  viewModel.setLocationOption(newValue);
                  if (newValue == 'custom') {
                    viewModel.showCustomLocationBottomSheet();
                  }
                }
              },
              activeColor: kcPrimaryColor,
            ),
          ),
          Gap(8.w),
          Text(
            title,
            style: context.bodyMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
