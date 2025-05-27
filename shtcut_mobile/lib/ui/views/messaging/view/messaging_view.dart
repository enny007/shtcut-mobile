import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/messaging/view_model/messaging_view_model.dart';
import 'package:shtcut_mobile/ui/views/messaging/widgets/group_tile.dart';
import 'package:stacked/stacked.dart';

class MessagingView extends StackedView<MessagingViewModel> {
  const MessagingView({super.key});

  @override
  Widget builder(
      BuildContext context, MessagingViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
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
            'Messages',
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
            topverticalPercentage: 0.h,
            bottomverticalPercentage: 20.h,
            context: context,
          ),
          child: Column(
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
                      hintText: 'Search',
                      prefixIcon: SvgPicture.asset(
                        'assets/svgs/search.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Gap(2.w),
                  GestureDetector(
                    onTap: () {
                      viewModel.navigateToNewChat();
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
                        'New Chat',
                        style: context.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(12.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 15.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: viewModel.messageList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1.h,
                      thickness: 1.h,
                      color: const Color(0xffF2F2F2),
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final message = viewModel.messageList[index];
                    return GroupTile(
                      title: message['title'],
                      subtitle: message['subtitle'],
                      timestamp: message['timestamp'],
                      unreadCount: message['unreadCount'],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  MessagingViewModel viewModelBuilder(BuildContext context) {
    return MessagingViewModel();
  }
}
