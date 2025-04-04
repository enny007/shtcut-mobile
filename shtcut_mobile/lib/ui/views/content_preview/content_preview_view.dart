import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/content_preview/content_preview_view_model.dart';
import 'package:shtcut_mobile/ui/views/content_preview/widget/social_card.dart';
import 'package:shtcut_mobile/ui/views/content_preview/widget/social_media_selector_tile.dart';
import 'package:shtcut_mobile/ui/views/content_preview/widget/social_profile_container.dart';
import 'package:stacked/stacked.dart';

class ContentPreviewView extends StackedView<ContentPreviewViewModel> {
  const ContentPreviewView({super.key});

  @override
  Widget builder(
      BuildContext context, ContentPreviewViewModel viewModel, Widget? child) {
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
          'Post Preview',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Preview card
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 15.h,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preview',
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
                  const SocialProfilesContainer(),
                  Gap(21.h),
                  // SocialMediaSelector(
                  //   initialSelection: viewModel.selectedSocialTypes,
                  //   onSelectionChanged: (selectedTypes) {
                  //     viewModel.updateSelectedSocialTypes(selectedTypes);
                  //   },
                  // ),
                ],
              ),
            ),

            // Social card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: viewModel.posts.isNotEmpty
                  ? SocialCard(
                      profileImageUrl: viewModel.posts[1]['profileImageUrl'],
                      username: viewModel.posts[1]['username'],
                      postImages:
                          List<String>.from(viewModel.posts[1]['postImages']),
                      caption: viewModel.posts[1]['caption'],
                      likesCount: viewModel.posts[1]['likesCount'],
                      commentsCount: viewModel.posts[1]['commentsCount'],
                      isLiked: viewModel.posts[1]['isLiked'],
                      isBookmarked: viewModel.posts[1]['isBookmarked'],
                      onLike: () {
                        // Handle like action
                      },
                      onComment: () {
                        // Handle comment action
                      },
                      onShare: () {
                        // Handle share action
                      },
                      onBookmark: () {
                        // Handle bookmark action
                      },
                      onMoreOptions: () {
                        // Handle more options
                      },
                    )
                  : const SizedBox.shrink(),
            ),

            // Add some bottom padding to ensure content is scrollable
            Gap(100.h),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AppButton(
                callback: () {
                  viewModel.showCalendar();
                },
                text: 'Schedule',
                textColor: kcPrimaryColor,
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: kcPrimaryColor,
                ),
              ),
            ),
            Gap(9.w),
            Expanded(
              flex: 2,
              child: AppButton(
                callback: () {
                  viewModel.showSuccessfulPosting();
                },
                text: 'Publish',
                color: kcPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ContentPreviewViewModel viewModelBuilder(BuildContext context) {
    return ContentPreviewViewModel();
  }
}
