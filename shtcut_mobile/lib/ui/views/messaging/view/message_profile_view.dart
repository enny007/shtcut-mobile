import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/messaging/view_model/message_profile_view_model.dart';
import 'package:shtcut_mobile/ui/views/messaging/widgets/members_profile_tile.dart';
import 'package:shtcut_mobile/ui/views/messaging/widgets/profile_widget.dart';
import 'package:stacked/stacked.dart';

class MessageProfileView extends StackedView<MessageProfileViewModel> {
  const MessageProfileView({super.key});

  @override
  Widget builder(
      BuildContext context, MessageProfileViewModel viewModel, Widget? child) {
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
          'Profile',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsExtension.fromPercentage(
          lefthorizontalPercentage: 23.w,
          righthorizontalPercentage: 23.w,
          topverticalPercentage: 0.h,
          bottomverticalPercentage: 20.h,
          context: context,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(31.h),
              Center(
                child: GestureDetector(
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/pic_1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(10.h),
              Center(
                child: Text(
                  'Marketing Team',
                  style: context.bodyLarge!.copyWith(
                    color: const Color(0xff151314),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Gap(4.h),
              Center(
                child: Text(
                  'You, Sarah Parker & 20 others',
                  style: context.bodySmall!.copyWith(
                    color: const Color(0xff726C6C),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Gap(13.h),
              Center(
                child: Container(
                  height: 90.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 27.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: ListView.separated(
                    itemCount: viewModel.profileList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return Gap(36.w);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final profile = viewModel.profileList[index];
                      return ProfileWidget(
                        assetName: profile['assetName'],
                        actionName: profile['actionName'],
                      );
                    },
                  ),
                ),
              ),
              Gap(13.h),
              Text(
                'All Media, Docs, Links',
                style: context.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(10.h),
              Container(
                height: 86.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 7.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(5.w);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(4.98.r),
                      child: Container(
                        width: 62.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.98.r),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/pic_1.png'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(10.h),
              AppButton(
                callback: () {
                  viewModel.navigateToMediaDetails();
                },
                color: kcPrimaryColor,
                text: 'View All',
              ),
              Gap(13.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '5 Members',
                      style: context.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.add,
                            color: kcPrimaryColor,
                          ),
                          Gap(4.w),
                          Text(
                            'Add Members',
                            style: context.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: kcPrimaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: kcPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(14.w),
                      Row(
                        children: [
                          SvgPicture.asset('assets/svgs/invite.svg'),
                          Gap(4.w),
                          Text(
                            'Invite via Link',
                            style: context.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: kcPrimaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: kcPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Gap(13.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 7.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: ListView.separated(
                  itemCount: viewModel.members.length,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(12.h);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final title = viewModel.members[index];
                    final isAdmin = viewModel.members[index];
                    return MembersProfileTile(
                      title: title['title'],
                      isAdmin: isAdmin['isAdmin'],
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
  MessageProfileViewModel viewModelBuilder(BuildContext context) {
    return MessageProfileViewModel();
  }
}
