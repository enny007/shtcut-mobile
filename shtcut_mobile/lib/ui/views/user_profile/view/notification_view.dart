import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/user_profile/view_models/notification_view_model.dart';
import 'package:shtcut_mobile/ui/views/user_profile/widgets/notification_tile.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({super.key});

  @override
  Widget builder(
      BuildContext context, NotificationViewModel viewModel, Widget? child) {
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
          'Notification',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: viewModel.notifications.length,
              separatorBuilder: (context, index) => Gap(10.h),
              itemBuilder: (context, index) {
                final notification = viewModel.notifications[index];
                return NotificationTile(
                  title: notification['title'],
                  subtitle: notification['subtitle'],
                  isEnabled: viewModel.getNotificationState(notification['id']),
                  onToggle: (value) {
                    viewModel.toggleNotification(notification['id']);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(BuildContext context) {
    return NotificationViewModel();
  }
}
