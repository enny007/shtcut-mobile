import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/messaging/view_model/add_group_view_model.dart';
import 'package:shtcut_mobile/ui/views/messaging/widgets/selectable_tile.dart';
import 'package:shtcut_mobile/ui/views/messaging/widgets/selected_member_chip.dart';
import 'package:stacked/stacked.dart';

class AddGroupMembersView extends StackedView<AddGroupMembersViewModel> {
  const AddGroupMembersView({super.key});

  @override
  Widget builder(
      BuildContext context, AddGroupMembersViewModel viewModel, Widget? child) {
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
            'Add Members',
            style: context.displaySmall!.copyWith(
              color: const Color(0xff101828),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: AppTextField(
                    controller: viewModel.nameController,
                    validator: (_) {
                      return null;
                    },
                    hintText: 'Search name',
                    prefixIcon: SvgPicture.asset(
                      'assets/svgs/search.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Gap(2.w),
                GestureDetector(
                  onTap: () {
                    // viewModel.showManageLibrarySheet();
                  },
                  child: Container(
                    // width: 79.w,
                    height: 46.h,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 14.w,
                    ),
                    decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Next',
                      style: context.bodySmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(14.h),
            //Selected members in a tile
            if (viewModel.selectedContacts.isNotEmpty)
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
                    itemCount: viewModel.selectedContacts.length,
                    itemBuilder: (context, index) {
                      // Find the contact data for the selected ID
                      final contactId =
                          viewModel.selectedContacts.elementAt(index);
                      final contact = viewModel.contacts.firstWhere(
                        (c) => c['id'] == contactId,
                        orElse: () => {
                          'name': 'Unknown',
                          'imageUrl': 'assets/images/pic_1.png'
                        },
                      );

                      return SelectedMemberChip(
                        name: contact['name'],
                        imageUrl: contact['imageUrl'],
                        onRemove: () =>
                            viewModel.toggleContactSelection(contactId),
                      );
                    },
                  ),
                ),
              ),
            Text(
              'All Members',
              style: context.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xff101828),
              ),
            ),
            Gap(11.h),
            Expanded(
              child: viewModel.getFilteredContacts().isEmpty
                  ? Center(
                      child: Text(
                        'No contacts found',
                        style: context.bodyMedium!.copyWith(
                          color: const Color(0xff726C6C),
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: viewModel.getFilteredContacts().length,
                      separatorBuilder: (context, index) => Divider(
                        height: 1.h,
                        thickness: 1.h,
                        color: const Color(0xffF2F2F2),
                      ),
                      itemBuilder: (context, index) {
                        final contact = viewModel.getFilteredContacts()[index];
                        return SelectableTile(
                          title: contact['name'],
                          subtitle: contact['subtitle'],
                          imageUrl: contact['imageUrl'],
                          isSelected:
                              viewModel.isContactSelected(contact['id']),
                          onSelect: () =>
                              viewModel.toggleContactSelection(contact['id']),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AddGroupMembersViewModel viewModelBuilder(BuildContext context) {
    return AddGroupMembersViewModel();
  }
}
