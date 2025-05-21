import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/create_topic/create_topic_view_model.dart';
import 'package:stacked/stacked.dart';

class CreateTopicView extends StackedView<CreateTopicViewModel> {
  const CreateTopicView({super.key});

  @override
  Widget builder(
      BuildContext context, CreateTopicViewModel viewModel, Widget? child) {
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
                child: Center(
                  child: Platform.isIOS
                      ? Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: kcPrimaryColor,
                            size: 18.29,
                          ),
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
          'Create Topic',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 18.h,
                horizontal: 11.w,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 18.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fill Information,',
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Gap(2.h),
                    Text(
                      'Customize and describe the purpose of the topic ',
                      style: context.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff667085),
                      ),
                    ),
                    Gap(16.h),
                    AppTextField(
                      controller: viewModel.brandNameController,
                      validator: (_) {
                        return null;
                      },
                      label: 'Brand name',
                      hintText: 'Enter brand name',
                    ),
                    Gap(16.h),
                    AppTextField(
                      controller: viewModel.topicDescriptionController,
                      validator: (_) {
                        return null;
                      },
                      label: 'Topic Description',
                      hintText: 'Enter description',
                      maxLines: 4,
                    ),
                    Gap(16.h),
                    // Inside the Column in the SingleChildScrollView, after the AppTextField widgets:

// Topic Type Dropdown
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Topic Type',
                          style: context.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff433E3F),
                          ),
                        ),
                        Gap(4.h),
                        GestureDetector(
                          onTap: viewModel.toggleTopicTypeDropdown,
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
                                  'assets/svgs/user-octagon.svg', // Replace with appropriate icon
                                  fit: BoxFit.scaleDown,
                                ),
                                Gap(8.w),
                                Expanded(
                                  child: Text(
                                    viewModel.selectedTopicType ??
                                        'Select Topic Type',
                                    style: context.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: viewModel.selectedTopicType != null
                                          ? const Color(0xff344054)
                                          : const Color(0xff98A2B3),
                                    ),
                                  ),
                                ),
                                Icon(
                                  viewModel.isTopicTypeDropdownOpen
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: kcPrimaryColor,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Topic Type Options with Checkboxes
                        if (viewModel.isTopicTypeDropdownOpen)
                          Container(
                            margin: EdgeInsets.only(top: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff101828)
                                      .withValues(alpha: 0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: viewModel.topicTypes.length,
                              itemBuilder: (context, index) {
                                final type = viewModel.topicTypes[index];
                                final isSelected =
                                    viewModel.selectedTopicType == type;

                                return GestureDetector(
                                  onTap: () => viewModel.selectTopicType(type),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: isSelected,
                                        onChanged: (_) =>
                                            viewModel.selectTopicType(type),
                                        activeColor: kcPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          type,
                                          style: context.bodyMedium!.copyWith(
                                            color: isSelected
                                                ? kcPrimaryColor
                                                : const Color(0xff344054),
                                            fontWeight: isSelected
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                    Gap(16.h),

// Social Media Sources Dropdown
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Social Media Sources',
                          style: context.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff433E3F),
                          ),
                        ),
                        Gap(4.h),
                        GestureDetector(
                          onTap: viewModel.toggleSocialMediaDropdown,
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
                                  'assets/svgs/user-octagon.svg', // Replace with appropriate icon
                                  fit: BoxFit.scaleDown,
                                ),
                                Gap(8.w),
                                Expanded(
                                  child: Text(
                                    viewModel.selectedSocialMediaText,
                                    style: context.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: viewModel
                                              .selectedSocialMedia.values
                                              .any((selected) => selected)
                                          ? const Color(0xff344054)
                                          : const Color(0xff98A2B3),
                                    ),
                                  ),
                                ),
                                Icon(
                                  viewModel.isSocialMediaDropdownOpen
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: kcPrimaryColor,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Social Media Options with Checkboxes
                        if (viewModel.isSocialMediaDropdownOpen)
                          Container(
                            margin: EdgeInsets.only(top: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff101828)
                                      .withValues(alpha: 0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: viewModel.socialMediaSources.length,
                              itemBuilder: (context, index) {
                                final source =
                                    viewModel.socialMediaSources[index];
                                final isSelected =
                                    viewModel.selectedSocialMedia[source] ??
                                        false;

                                return GestureDetector(
                                  onTap: () => viewModel
                                      .toggleSocialMediaSelection(source),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: isSelected,
                                        onChanged: (_) => viewModel
                                            .toggleSocialMediaSelection(source),
                                        activeColor: kcPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                      ),
                                      // Social Media Icon
                                      SvgPicture.asset(
                                        'assets/svgs/${viewModel.svgs[index]}.svg', // Make sure these assets exist
                                        height: 20.h,
                                        width: 20.w,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      Gap(8.w),
                                      Expanded(
                                        child: Text(
                                          source,
                                          style: context.bodyMedium!.copyWith(
                                            color: isSelected
                                                ? kcPrimaryColor
                                                : const Color(0xff344054),
                                            fontWeight: isSelected
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
            // viewModel.navigateToPreview();
          },
          text: 'Submit',
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  @override
  CreateTopicViewModel viewModelBuilder(BuildContext context) {
    return CreateTopicViewModel();
  }
}
