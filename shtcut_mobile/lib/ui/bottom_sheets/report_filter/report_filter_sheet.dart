import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/report_filter/report_filter_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReportFilterSheet extends StackedView<ReportFilterModel> {
  const ReportFilterSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, ReportFilterModel viewModel, Widget? child) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            children: [
              // Drag Handle
              Container(
                margin: EdgeInsets.only(top: 8.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: const Color(0xffE4E7EC),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filter Reports',
                            style: context.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff101828),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => completer?.call(SheetResponse()),
                            child: Icon(
                              Icons.close,
                              color: const Color(0xff475467),
                              size: 24.w,
                            ),
                          ),
                        ],
                      ),
                      Gap(20.h),

                      // Date Range Dropdown
                      Text(
                        'Date Range',
                        style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff344054),
                        ),
                      ),
                      Gap(8.h),
                      GestureDetector(
                        onTap: viewModel.toggleDateRangeDropdown,
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
                              Gap(8.w),
                              Expanded(
                                child: Text(
                                  viewModel.selectedDateRange,
                                  style: context.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff344054),
                                  ),
                                ),
                              ),
                              Icon(
                                viewModel.isDateRangeDropdownOpen
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: kcPrimaryColor,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (viewModel.isDateRangeDropdownOpen) ...[
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
                            children: viewModel.dateRangeOptions.map((option) {
                              return GestureDetector(
                                onTap: () => viewModel.selectDateRange(option),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        option,
                                        style: context.bodyMedium!.copyWith(
                                          color: const Color(0xff344054),
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
                      Gap(16.h),

                      // Social Media Accounts Dropdown
                      Text(
                        'Social Media Accounts',
                        style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff344054),
                        ),
                      ),
                      Gap(8.h),
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
                              Gap(8.w),
                              Expanded(
                                child: Text(
                                  viewModel.selectedSocialMediaText,
                                  style: context.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: viewModel.socialMediaAccounts.values
                                            .any((account) =>
                                                account['selected'])
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
                      if (viewModel.isSocialMediaDropdownOpen) ...[
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
                            children: viewModel.socialMediaAccounts.keys
                                .map((account) {
                              final accountData =
                                  viewModel.socialMediaAccounts[account]!;
                              return CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 16.r,
                                          backgroundImage: AssetImage(
                                              accountData['profileImage']),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            width: 12.w,
                                            height: 12.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                            ),
                                            child: SvgPicture.asset(
                                              accountData['socialIcon'],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(8.w),
                                    Expanded(
                                      child: Text(
                                        account,
                                        style: context.bodyMedium!.copyWith(
                                          color: const Color(0xff344054),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: accountData['selected'],
                                onChanged: (bool? value) {
                                  viewModel.toggleSocialMediaSelection(account);
                                },
                                activeColor: kcPrimaryColor,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                      Gap(16.h),

                      // Type Dropdown
                      Text(
                        'Type',
                        style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff344054),
                        ),
                      ),
                      Gap(8.h),
                      GestureDetector(
                        onTap: viewModel.toggleTypeDropdown,
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
                              Gap(8.w),
                              Expanded(
                                child: Text(
                                  viewModel.selectedTypesText,
                                  style: context.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: viewModel.selectedTypes.values
                                            .any((selected) => selected)
                                        ? const Color(0xff344054)
                                        : const Color(0xff98A2B3),
                                  ),
                                ),
                              ),
                              Icon(
                                viewModel.isTypeDropdownOpen
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: kcPrimaryColor,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (viewModel.isTypeDropdownOpen) ...[
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
                            children: viewModel.selectedTypes.keys.map((type) {
                              return CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  type,
                                  style: context.bodyMedium!.copyWith(
                                    color: const Color(0xff344054),
                                  ),
                                ),
                                value: viewModel.selectedTypes[type],
                                onChanged: (bool? value) {
                                  viewModel.toggleTypeSelection(type);
                                },
                                activeColor: kcPrimaryColor,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                      Gap(16.h),

                      // Assigned To Dropdown
                      Text(
                        'Assigned To',
                        style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff344054),
                        ),
                      ),
                      Gap(8.h),
                      GestureDetector(
                        onTap: viewModel.toggleAssignedToDropdown,
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
                              Gap(8.w),
                              Expanded(
                                child: Text(
                                  viewModel.selectedAssignedToText,
                                  style: context.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: viewModel.selectedAssignedTo.values
                                            .any((selected) => selected)
                                        ? const Color(0xff344054)
                                        : const Color(0xff98A2B3),
                                  ),
                                ),
                              ),
                              Icon(
                                viewModel.isAssignedToDropdownOpen
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: kcPrimaryColor,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (viewModel.isAssignedToDropdownOpen) ...[
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
                            children: viewModel.selectedAssignedTo.keys
                                .map((assignedTo) {
                              return CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  assignedTo,
                                  style: context.bodyMedium!.copyWith(
                                    color: const Color(0xff344054),
                                  ),
                                ),
                                value: viewModel.selectedAssignedTo[assignedTo],
                                onChanged: (bool? value) {
                                  viewModel
                                      .toggleAssignedToSelection(assignedTo);
                                },
                                activeColor: kcPrimaryColor,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                      Gap(16.h),

                      // Tags Dropdown
                      Text(
                        'Tags',
                        style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff344054),
                        ),
                      ),
                      Gap(8.h),
                      GestureDetector(
                        onTap: viewModel.toggleTagsDropdown,
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
                              Gap(8.w),
                              Expanded(
                                child: Text(
                                  viewModel.selectedTagsText,
                                  style: context.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: viewModel.selectedTags.values
                                            .any((selected) => selected)
                                        ? const Color(0xff344054)
                                        : const Color(0xff98A2B3),
                                  ),
                                ),
                              ),
                              Icon(
                                viewModel.isTagsDropdownOpen
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: kcPrimaryColor,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (viewModel.isTagsDropdownOpen) ...[
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
                            children: viewModel.selectedTags.keys.map((tag) {
                              return CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  tag,
                                  style: context.bodyMedium!.copyWith(
                                    color: const Color(0xff344054),
                                  ),
                                ),
                                value: viewModel.selectedTags[tag],
                                onChanged: (bool? value) {
                                  viewModel.toggleTagSelection(tag);
                                },
                                activeColor: kcPrimaryColor,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                      Gap(24.h),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                viewModel.resetFilters();
                              },
                              child: Container(
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: kcPrimaryColor.withValues(alpha: .1),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Reset All',
                                  style: context.bodyMedium!.copyWith(
                                    color: kcPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                viewModel.applyFilters();
                                completer?.call(SheetResponse(
                                  confirmed: true,
                                  data: {
                                    'dateRange': viewModel.selectedDateRange,
                                    'socialMediaAccounts':
                                        viewModel.socialMediaAccounts,
                                    'types': viewModel.selectedTypes,
                                    'assignedTo': viewModel.selectedAssignedTo,
                                    'tags': viewModel.selectedTags,
                                  },
                                ));
                              },
                              child: Container(
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: kcPrimaryColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  viewModel.appliedFiltersCount > 0
                                      ? 'Apply Filter (${viewModel.appliedFiltersCount})'
                                      : 'Apply Filter',
                                  style: context.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  ReportFilterModel viewModelBuilder(BuildContext context) {
    return ReportFilterModel();
  }
}
