import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/messaging/view_model/new_group_view_model.dart';
import 'package:shtcut_mobile/ui/views/messaging/widgets/selected_member_chip.dart';
import 'package:stacked/stacked.dart';

class NewGroupView extends StackedView<NewGroupViewModel> {
  const NewGroupView({
    super.key,
    required this.selectedMembers,
  });
  final List<Map<String, dynamic>> selectedMembers;

  @override
  Widget builder(
      BuildContext context, NewGroupViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
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
            'New Group',
            style: context.displaySmall!.copyWith(
              color: const Color(0xff101828),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 19.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Container(
                    height: 42.h,
                    width: 42.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffDCE5FB),
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/icons/new_group_camera.svg',
                    ),
                  ),
                  Gap(16.w),
                  Text(
                    'Enter group name (Optional)',
                    style: context.bodySmall!.copyWith(
                      color: const Color(0xff726C6C),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Gap(23.h),
            Text(
              'Members: ${viewModel.selectedMembers.length} Selected',
              style: context.displaySmall!.copyWith(
                color: const Color(0xff726C6C),
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(6.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 8.h,
              ),
              child: SizedBox(
                height: 90.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.selectedMembers.length,
                  itemBuilder: (context, index) {
                    final member = viewModel.selectedMembers[index];
                    return SelectedMemberChip(
                      name: member['name'],
                      imageUrl: member['imageUrl'],
                      onRemove: () {
                        // Remove member from the list
                        viewModel.selectedMembers.removeAt(index);
                        viewModel.notifyListeners();
                      },
                    );
                  },
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
            callback: () {},
            text: 'Create New Group',
            color: kcPrimaryColor,
          ),
        ),
      ),
    );
  }

  @override
  NewGroupViewModel viewModelBuilder(BuildContext context) {
    return NewGroupViewModel()..initializeWithSelectedMembers(selectedMembers);
  }
}
