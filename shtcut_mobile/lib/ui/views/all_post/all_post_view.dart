import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/all_post/all_post_view_model.dart';
import 'package:shtcut_mobile/ui/views/all_post/widgets/post_card.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:stacked/stacked.dart';

class AllPostView extends StackedView<AllPostViewModel> {
  const AllPostView({super.key});

  @override
  Widget builder(
      BuildContext context, AllPostViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F3F8),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170.h,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 19.w,
                top: 90.h,
                bottom: 30.h,
              ),
              decoration: const BoxDecoration(
                color: kcPrimaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Posts',
                    style: context.displaySmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    'Manage all your social media posts',
                    style: context.bodyMedium!.copyWith(
                      color: const Color(0xffD9D6FE),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsExtension.fromPercentage(
                  lefthorizontalPercentage: 12.w,
                  righthorizontalPercentage: 12.w,
                  topverticalPercentage: 20.h,
                  bottomverticalPercentage: 10.h,
                  context: context,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 48.h,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 8.w,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: const Color(0xffCCCBCB),
                          width: 1.w,
                        ),
                      ),
                      child: Row(
                        children: [
                          _buildTabOption(
                            context: context,
                            title: 'Scheduled',
                            index: 0,
                            currentIndex: viewModel.currentTabIndex,
                            onTap: () => viewModel.setTabIndex(0),
                          ),
                          _buildTabOption(
                            context: context,
                            title: 'Live',
                            index: 1,
                            currentIndex: viewModel.currentTabIndex,
                            onTap: () => viewModel.setTabIndex(1),
                          ),
                        ],
                      ),
                    ),
                    Gap(16.h),
                    Expanded(
                      child: viewModel.currentTabIndex == 0
                          ? _buildScheduledPostsList(context, viewModel)
                          : _buildLivePostsList(context, viewModel),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AllPostViewModel viewModelBuilder(BuildContext context) {
    return AllPostViewModel();
  }

  Widget _buildTabOption({
    required BuildContext context,
    required String title,
    required int index,
    required int currentIndex,
    required VoidCallback onTap,
  }) {
    final bool isActive = index == currentIndex;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // height: 30.h,
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: isActive ? kcPrimaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(4.r),
          ),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              title,
              style: context.bodySmall!.copyWith(
                color: isActive
                    ? const Color(0xffFAFAFA)
                    : const Color(0xff0A0A0B),
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScheduledPostsList(
      BuildContext context, AllPostViewModel viewModel) {
    final scheduledPosts = viewModel.getScheduledPosts();

    if (scheduledPosts.isEmpty) {
      return Center(
        child: Text(
          'No scheduled posts',
          style: context.bodyMedium!.copyWith(
            color: const Color(0xff5A5555),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: scheduledPosts.length,
      separatorBuilder: (context, index) => Gap(16.h),
      itemBuilder: (context, index) {
        final post = scheduledPosts[index];
        return PostCard(
          title: post['title'],
          scheduledTime: post['scheduledTime'],
          socialIcons: post['socialIcons'],
          imageUrl: post['imageUrl'],
          additionalImagesCount: post['additionalImagesCount'],
          onEdit: () {
            // Handle edit action
            viewModel.navigateToEditPost();
          },
          onPublish: () {
            // Handle publish action
            viewModel.showPublishPost();
          },
        );
      },
    );
  }

  Widget _buildLivePostsList(BuildContext context, AllPostViewModel viewModel) {
    final livePosts = viewModel.getLivePosts();

    if (livePosts.isEmpty) {
      return Center(
        child: Text(
          'No live posts',
          style: context.bodyMedium!.copyWith(
            color: const Color(0xff5A5555),
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: livePosts.length,
      itemBuilder: (context, index) {
        final post = livePosts[index];
        return PostCard(
          title: post['title'],
          scheduledTime: post['scheduledTime'],
          socialIcons: post['socialIcons'],
          imageUrl: post['imageUrl'],
          additionalImagesCount: post['additionalImagesCount'],
          onEdit: () {
            // Handle edit action for live posts
          },
          onPublish: () {
            // For live posts, this could be "Boost" or "Promote" instead
          },
        );
      },
    );
  }
}
