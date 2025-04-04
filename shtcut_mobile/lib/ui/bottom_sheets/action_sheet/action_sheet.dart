import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/action_sheet/action_model.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/action_sheet/widgets/selectable_card.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ActionSheet extends StackedView<ActionModel> {
  const ActionSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(BuildContext context, ActionModel viewModel, Widget? child) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7.h,
        maxChildSize: 0.8.h,
        minChildSize: 0.5.h,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => completer!(SheetResponse(confirmed: true)),
                    child: const Icon(
                      Icons.close,
                      color: Color(0xff433E3F),
                    ),
                  ),
                ),
                Gap(8.h),
                Text(
                  'Grow your social media',
                  style: context.displaySmall!.copyWith(
                    fontSize: 18.sp,
                    color: const Color(0xff101828),
                  ),
                ),
                Gap(4.h),
                Text(
                  'Manage your social accounts with just one clicks, select any actions to grow socials.',
                  style: context.bodySmall!.copyWith(
                    color: const Color(0xff726C6C),
                  ),
                ),
                Gap(19.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableCard(
                          leadingImage:
                              SvgPicture.asset('assets/svgs/folder-open.svg'),
                          title: 'Create New Posts',
                          subtitle: 'Post to your social platform',
                          onTap: () {
                            viewModel.navigateToCreatePost();
                          },
                        ),
                        Gap(6.h),
                        SelectableCard(
                          leadingImage: SvgPicture.asset(
                            'assets/svgs/summary_video.svg',
                            colorFilter: const ColorFilter.mode(
                              Color(0xff5A5555),
                              BlendMode.srcIn,
                            ),
                          ),
                          title: 'Create Live Stream',
                          subtitle: 'Post to your social platform',
                          onTap: () {},
                        ),
                        Gap(6.h),
                        SelectableCard(
                          leadingImage:
                              SvgPicture.asset('assets/svgs/Broadcast.svg'),
                          title: 'Create New Ad',
                          subtitle: 'Post to your social platform',
                          onTap: () {},
                        ),
                        Gap(22.h),
                        Text(
                          'Manage your audience',
                          style: context.bodySmall!.copyWith(
                            color: const Color(0xff151314),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(16.h),
                        SelectableCard(
                          leadingImage:
                              SvgPicture.asset('assets/svgs/signpost.svg'),
                          title: 'All Posts',
                          subtitle: 'View all created posts',
                          onTap: () {},
                        ),
                        Gap(6.h),
                        SelectableCard(
                          leadingImage:
                              SvgPicture.asset('assets/svgs/gallery.svg'),
                          title: 'Media Library',
                          subtitle: 'Manage your library',
                          onTap: () {},
                        ),
                        Gap(6.h),
                        SelectableCard(
                          leadingImage:
                              SvgPicture.asset('assets/svgs/message-text.svg'),
                          title: 'Messages',
                          subtitle: 'Chat with members of your workspace',
                          onTap: () {},
                        ),
                        Gap(6.h),
                        SelectableCard(
                          leadingImage:
                              SvgPicture.asset('assets/svgs/status-up.svg'),
                          title: 'Report',
                          subtitle: 'View user responses to post and more',
                          onTap: () {},
                        ),
                        Gap(6.h),
                        SelectableCard(
                          leadingImage:
                              SvgPicture.asset('assets/svgs/voice-square.svg'),
                          title: 'Social Listening',
                          subtitle:
                              'Leverage social listening data as a strategic partner',
                          onTap: () {},
                        ),
                        Gap(6.h),
                        SelectableCard(
                          leadingImage:
                              SvgPicture.asset('assets/svgs/task-square.svg'),
                          title: 'Tasks',
                          subtitle: 'View all tasks and more',
                          onTap: () {},
                        ),
                        Gap(6.h),
                        // SelectableCard(
                        //   leadingImage:
                        //       SvgPicture.asset('assets/svgs/profile.svg'),
                        //   title: 'Social Accounts',
                        //   subtitle: 'Manage all your social accounts',
                        //   onTap: () {},
                        // ),
                        Gap(20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  ActionModel viewModelBuilder(BuildContext context) {
    return ActionModel();
  }
}
