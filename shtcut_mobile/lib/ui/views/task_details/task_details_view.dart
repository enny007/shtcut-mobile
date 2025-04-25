import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/task_details/task_details_view_model.dart';
import 'package:shtcut_mobile/ui/views/task_details/widgets/attachment_items.dart';
import 'package:shtcut_mobile/ui/views/task_details/widgets/dropdown.dart';
import 'package:stacked/stacked.dart';

class TaskDetailsView extends StackedView<TaskDetailsViewModel> {
  const TaskDetailsView({super.key});

  @override
  Widget builder(
      BuildContext context, TaskDetailsViewModel viewModel, Widget? child) {
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
          'Task Details',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                      AppTextField(
                        controller: viewModel.taskTitleController,
                        validator: (_) {
                          return null;
                        },
                        label: 'Task Title',
                        hintText: 'Enter task title',
                        prefixIcon: SvgPicture.asset(
                          'assets/svgs/notification-status.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Gap(16.h),
                      AppTextField(
                        controller: viewModel.taskDescriptionController,
                        validator: (_) {
                          return null;
                        },
                        label: 'Task Description',
                        hintText: 'Enter task description',
                        maxLines: 4,
                      ),
                      Gap(16.h),
                      CustomDropdown(
                        hintText: 'Select Member',
                        label: 'Assign To',
                        value: viewModel.selectedMember,
                        isOpen: viewModel.isMemberDropdownOpen,
                        onToggle: viewModel.toggleMemberDropdown,
                        prefixIcon: SvgPicture.asset(
                          'assets/svgs/user.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        items: viewModel.members,
                        onItemSelected: viewModel.selectMember,
                      ),
                      Gap(16.h),
                      CustomDropdown(
                        hintText: 'Select Priority',
                        label: 'Priority',
                        value: viewModel.selectedPriority,
                        isOpen: viewModel.isPriorityDropdownOpen,
                        onToggle: viewModel.togglePriorityDropdown,
                        prefixIcon: SvgPicture.asset(
                          'assets/svgs/layer.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        items: viewModel.priorities,
                        onItemSelected: viewModel.selectPriority,
                      ),
                      Gap(16.h),
                      CustomDropdown(
                        hintText: 'Select Difficulty',
                        label: 'Difficulty',
                        value: viewModel.selectedDifficulty,
                        isOpen: viewModel.isDifficultyDropdownOpen,
                        onToggle: viewModel.toggleDifficultyDropdown,
                        prefixIcon: SvgPicture.asset(
                          'assets/svgs/chart.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        items: viewModel.difficulties,
                        onItemSelected: viewModel.selectDifficulty,
                      ),
                      Gap(16.h),
                      Text(
                        'Attachment',
                        style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Gap(2.h),
                      Text(
                        'Format should be in .pdf .jpeg .png less than 5MB',
                        style: context.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff667085),
                        ),
                      ),
                      Gap(16.h),
                      viewModel.attachedImages.isEmpty
                          ? GestureDetector(
                              onTap: viewModel.pickImage,
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(8.r),
                                color: const Color(0xff98A2B3),
                                strokeWidth: 1,
                                dashPattern: const [6, 3],
                                child: Container(
                                  width: double.infinity,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF9FAFB),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffF2F4F7),
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/svgs/drag.svg',
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 8.w,
                                  runSpacing: 8.h,
                                  children: List.generate(
                                    viewModel.attachedImages.length,
                                    (index) => AttachmentItem(
                                      image: viewModel.attachedImages[index],
                                      onDelete: () =>
                                          viewModel.removeImage(index),
                                    ),
                                  ),
                                ),
                                Gap(16.h),
                                // Add more button
                                GestureDetector(
                                  onTap: viewModel.pickImage,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: kcPrimaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: kcPrimaryColor,
                                          size: 16.sp,
                                        ),
                                        Gap(4.w),
                                        Text(
                                          'Add More',
                                          style: context.bodySmall!.copyWith(
                                            color: kcPrimaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
            viewModel.showCreateNewTask();
          },
          text: 'Create Task',
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  @override
  TaskDetailsViewModel viewModelBuilder(BuildContext context) {
    return TaskDetailsViewModel();
  }
}
