import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/user_profile/view_models/user_profile_view_model.dart';
import 'package:shtcut_mobile/ui/views/user_profile/widgets/list_tile_container.dart';
import 'package:stacked/stacked.dart';

class UserProfileView extends StackedView<UserProfileViewModel> {
  const UserProfileView({super.key});

  @override
  Widget builder(
      BuildContext context, UserProfileViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F3F8),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 180.h,
              padding: EdgeInsets.only(
                left: 18.w,
                right: 9.w,
                top: 30.h,
                bottom: 10.h,
              ),
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => navRouter.back(),
                    child: Platform.isIOS
                        ? Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 18.29,
                            ),
                          )
                        : const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 18.29,
                          ),
                  ),
                  Gap(10.w),
                  Text(
                    'My Profile',
                    style: context.displayLarge!.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 32.h,
                  bottom: 40.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.38.r),
                          child: Container(
                            height: 54.h,
                            width: 54.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.38),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/pic_1.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(17.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'John Doe',
                            style: context.displaySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff101828),
                            ),
                          ),
                          Gap(4.w),
                          SvgPicture.asset(
                            'assets/svgs/verify.svg',
                          ),
                        ],
                      ),
                      Gap(3.h),
                      Center(
                        child: Text(
                          'Junior Full Stack Developer',
                          style: context.bodyMedium!.copyWith(
                            fontSize: 13,
                            color: kcPrimaryColor,
                          ),
                        ),
                      ),
                      Gap(12.h),
                      Text(
                        'ACCOUNT',
                        style: context.bodySmall!.copyWith(
                          color: const Color(0xff344054),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(8.h),
                      ListTileContainer(
                        child: Column(
                          children: [
                            _buildListTile(
                              leadingPath: 'assets/svgs/profile_user.svg',
                              title: 'Personal Data',
                              context: context,
                              onTap: () {
                                viewModel.navigateToEditProfile();
                              },
                            ),
                            Gap(15.h),
                            _buildListTile(
                              leadingPath:
                                  'assets/svgs/profile_notification.svg',
                              title: 'Notifications',
                              context: context,
                              onTap: () {
                                viewModel.navigateToNotifications();
                              },
                            ),
                          ],
                        ),
                      ),
                      Gap(20.h),
                      Text(
                        'SETTINGS',
                        style: context.bodySmall!.copyWith(
                          color: const Color(0xff344054),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(8.h),
                      ListTileContainer(
                        child: Column(
                          children: [
                            _buildListTile(
                              leadingPath: 'assets/svgs/profile_setting.svg',
                              title: 'Change Password',
                              context: context,
                              onTap: () {
                                viewModel.navigateToChangePassword();
                              },
                            ),
                            Gap(15.h),
                            _buildListTile(
                              leadingPath:
                                  'assets/svgs/profile_integration.svg',
                              title: 'Integrations',
                              context: context,
                              onTap: () {},
                            ),
                            Gap(15.h),
                            _buildListTile(
                              leadingPath: 'assets/svgs/profile_help.svg',
                              title: 'Help & Support',
                              context: context,
                              onTap: () {
                                viewModel.navigateToHelpSupport();
                              },
                            ),
                            Gap(15.h),
                            _buildListTile(
                              leadingPath: 'assets/svgs/profile_logout.svg',
                              title: 'Logout',
                              context: context,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  UserProfileViewModel viewModelBuilder(BuildContext context) {
    return UserProfileViewModel();
  }

  Widget _buildListTile({
    required String leadingPath,
    required String title,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(leadingPath),
          Gap(15.w),
          Expanded(
            child: Text(
              title,
              style: context.bodySmall!.copyWith(
                fontSize: 11.sp,
                color: const Color(0xff4F5464),
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xffB6C2D7),
          ),
        ],
      ),
    );
  }
}
