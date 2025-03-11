import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/connect_accounts/widgets/account_tile.dart';
import 'package:shtcut_mobile/ui/views/create_post/create_post_view_model.dart';
import 'package:shtcut_mobile/ui/views/create_post/widgets/collapsible_account_tile.dart';
import 'package:stacked/stacked.dart';

class CreatePostView extends StackedView<CreatePostViewModel> {
  const CreatePostView({super.key});

  @override
  Widget builder(
      BuildContext context, CreatePostViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 750.h,
              child: Stack(
                children: [
                  Container(
                    height: 233.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 45.h,
                    ),
                    decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.r),
                        bottomRight: Radius.circular(24.r),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: IconButton(
                        icon: Platform.isIOS
                            ? const Icon(CupertinoIcons.back,
                                color: Colors.white)
                            : const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => navRouter.back(),
                      ),
                      title: Text(
                        'Create New Post',
                        style: context.displayMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffFEFEFE),
                        ),
                      ),
                      subtitle: Text(
                        'Post to your social platforms ',
                        style: context.bodyMedium!.copyWith(
                          color: const Color(0xffD9D6FE),
                        ),
                      ),
                      trailing: SvgPicture.asset(
                        'assets/svgs/placard_icon.svg',
                        height: 80.h,
                        width: 87.w,
                        // fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  //Stacked Container
                  Positioned(
                    top: 133
                        .h, // This positions it to overlap 100 units (233 - 133 = 100)
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 15.h,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Social media',
                            style: context.bodyMedium!.copyWith(
                              color: const Color(0xff101828),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(2.h),
                          Text(
                            'Select the social media platforms you want to post to',
                            style: context.bodySmall!.copyWith(
                              color: const Color(0xff475467),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(21.h),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const AccountTile(
                                    svgPath: 'assets/svgs/instagram_logo.svg',
                                    title: 'Instagram',
                                  ),
                                  Gap(14.h),
                                  const CollapsibleAccountTile(
                                    svgPath: 'assets/svgs/x_logo.svg',
                                    title: 'Twitter',
                                    children: [],
                                  ),
                                  Gap(14.h),
                                  const CollapsibleAccountTile(
                                    svgPath: 'assets/svgs/facebook_logo.svg',
                                    title: 'Facebook',
                                    children: [],
                                  ),
                                  Gap(14.h),
                                  const CollapsibleAccountTile(
                                    svgPath: 'assets/svgs/tiktok_logo.svg',
                                    title: 'Tiktok',
                                    children: [],
                                  ),
                                  Gap(14.h),
                                  const CollapsibleAccountTile(
                                    svgPath: 'assets/svgs/youtube_logo.svg',
                                    title: 'Youtube',
                                    children: [],
                                  ),
                                  Gap(14.h),
                                  const CollapsibleAccountTile(
                                    svgPath: 'assets/svgs/linkedin_logo.svg',
                                    title: 'LinkedIn',
                                    children: [],
                                  ),
                                  Gap(14.h),
                                  const CollapsibleAccountTile(
                                    svgPath: 'assets/svgs/pinterest_logo.svg',
                                    title: 'Pinterest',
                                    children: [],
                                  ),
                                  Gap(14.h),
                                  const CollapsibleAccountTile(
                                    svgPath: 'assets/svgs/threads_logo.svg',
                                    title: 'Threads',
                                    children: [],
                                  ),
                                  Gap(50.h),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: AppButton(
                        callback: () {},
                        text: 'Next',
                        color: kcPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Container
          ],
        ),
      ),
    );
  }

  @override
  CreatePostViewModel viewModelBuilder(BuildContext context) {
    return CreatePostViewModel();
  }
}
