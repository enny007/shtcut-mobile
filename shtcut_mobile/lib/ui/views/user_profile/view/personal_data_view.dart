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
import 'package:shtcut_mobile/ui/views/user_profile/view_models/personal_data_view_model.dart';
import 'package:stacked/stacked.dart';

class PersonalDataView extends StackedView<PersonalDataViewModel> {
  const PersonalDataView({super.key});

  @override
  Widget builder(
      BuildContext context, PersonalDataViewModel viewModel, Widget? child) {
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
          'Personal Data',
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
                      'My Personal Data',
                      style: context.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(2.h),
                    Text(
                      'Details about my personal data',
                      style: context.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff667085),
                      ),
                    ),
                    Gap(16.h),
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/pic_1.png',
                                  ),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -8.h,
                            right: -8.w,
                            child: GestureDetector(
                              onTap: () {
                                // Handle icon tap (e.g., edit profile picture)
                                print('Edit profile picture tapped');
                              },
                              child: SvgPicture.asset(
                                'assets/svgs/profile_sync.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(12.h),
                    Center(
                      child: Text(
                        'Upload Photo',
                        style: context.bodySmall!.copyWith(
                          color: const Color(0xff475467),
                        ),
                      ),
                    ),
                    Gap(16.h),
                    AppTextField(
                      controller: viewModel.firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      label: 'First Name',
                      prefixIcon: SvgPicture.asset(
                        'assets/svgs/profile_user.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Gap(16.h),
                    AppTextField(
                      controller: viewModel.lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      label: 'Last Name',
                      prefixIcon: SvgPicture.asset(
                        'assets/svgs/profile_user.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Gap(16.h),
                    AppTextField(
                      label: 'Date of Birth',
                      controller: viewModel.dobController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your date of birth';
                        }
                        return null;
                      },
                      hintText: 'Select your date of birth',
                      isDatePicker: true,
                      onTap: () => viewModel.selectDate(context),
                      prefixIcon: SvgPicture.asset(
                        'assets/svgs/calendar.svg',
                        fit: BoxFit.scaleDown,
                        colorFilter: const ColorFilter.mode(
                          kcPrimaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Gap(16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Position',
                          style: context.bodySmall!.copyWith(
                            color: kcTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Gap(4.h),
                        GestureDetector(
                          onTap: viewModel.togglePositionDropdown,
                          child: Container(
                            height: 44.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: const Color(0xffDFDFDF),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/keyboard.svg',
                                ),
                                Gap(10.w),
                                Expanded(
                                  child: Text(
                                    viewModel.selectedPositionText,
                                    style: context.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: viewModel.selectedPosition.isEmpty
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                Icon(
                                  viewModel.isPositionDropdownOpen
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: kcPrimaryColor,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (viewModel.isPositionDropdownOpen) ...[
                          Gap(8.h),
                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: const Color(0xffDFDFDF),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children:
                                  viewModel.positionOptions.map((position) {
                                return GestureDetector(
                                  onTap: () =>
                                      viewModel.selectPosition(position),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.h),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            position,
                                            style: context.bodyMedium!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ],
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
            viewModel.showUpdateProfile();
          },
          text: 'Update',
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  @override
  PersonalDataViewModel viewModelBuilder(BuildContext context) {
    return PersonalDataViewModel();
  }
}
