import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/home/home_view_model.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/adaptable_icon.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/collapsible_card.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/collapsible_item.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/summary_card.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F3F8),
        appBar: AppBar(
          toolbarHeight: 90.h,
          centerTitle: false,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              bottom: 30.h,
            ),
            child: CircleAvatar(
              radius: 44.r,
              backgroundImage: const AssetImage(
                'assets/images/home_page_placard.png',
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(
              bottom: 30.h,
            ),
            child: Text(
              'Heyya!!',
              style: context.bodySmall!.copyWith(
                color: kcPrimaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 12.w,
                bottom: 30.h,
              ),
              child: Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xffF0F1FF),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/svgs/notification.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Gap(8.w),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xffF0F1FF),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/svgs/setting.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsetsExtension.fromPercentage(
            lefthorizontalPercentage: 12.w,
            righthorizontalPercentage: 12.w,
            topverticalPercentage: 10.h,
            bottomverticalPercentage: 0.h,
            context: context,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //SummaryCard
                const SummaryCard(),
                Gap(10.h),
                CollapsibleDropdown(
                  title: 'Your Post Calendar',
                  count: 2,
                  subtitle: 'Your Schedule for the day',
                  children: [
                    CollapsibleItem(
                      title: 'SpaceX News',
                      icons: viewModel.spaceItem,
                      showBorder: true,
                      buttonText: 'View Posts',
                      isSpaceX: true,
                    ),
                    Gap(10.h),
                    const CollapsibleItem(
                      title: 'Dashboard Report',
                      icons: [
                        CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/pic_2.png')),
                      ],
                      showBorder: true,
                      buttonText: 'View Post',
                    ),
                  ],
                ),
                Gap(10.h),
                CollapsibleDropdown(
                  title: 'Live Streams',
                  count: 2,
                  subtitle: 'All streams & videos',
                  children: [
                    CollapsibleItem(
                      title: 'How to become an IT',
                      icons: viewModel.liveStream,
                      showBorder: false,
                      buttonText: 'View',
                    ),
                    Gap(10.h),
                    CollapsibleItem(
                      title: '60k Giveaway',
                      icons: viewModel.giveAway,
                      showBorder: false,
                      buttonText: 'View',
                    ),
                  ],
                ),
                Gap(10.h),
                CollapsibleDropdown(
                  title: 'Today Task',
                  count: 1,
                  subtitle: 'The tasks assigned to you for today',
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffF9FAFB),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: const Color(0xffEAECF0),
                          width: 1.w,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.w,
                        vertical: 13.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 24.h,
                                width: 24.w,
                                decoration: const BoxDecoration(
                                  color: kcPrimaryColor,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/svgs/thunder.svg',
                                ),
                              ),
                              Gap(6.w),
                              Text(
                                'Wiring Dashboard Analytics',
                                style: context.bodyMedium!.copyWith(
                                  color: const Color(0xff2B2B2B),
                                ),
                              ),
                            ],
                          ),
                          Gap(15.h),
                          Row(
                            children: [
                              Container(
                                height: 23.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffEAECF0),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                ),
                                // alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svgs/summary_clock.svg',
                                      height: 10.h,
                                      width: 10.w,
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xffD0D5DD),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Gap(2.w),
                                    Text(
                                      'In Progress',
                                      style: context.bodySmall!.copyWith(
                                        color: const Color(0xff475467),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Gap(14.w),
                              Container(
                                height: 23.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffC03744),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svgs/flag_notice.svg',
                                      height: 10.h,
                                      width: 10.w,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Gap(2.w),
                                    Text(
                                      'High',
                                      style: context.bodySmall!.copyWith(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Gap(12.h),
                          LinearProgressIndicator(
                            value: 0.8,
                            color: kcPrimaryColor,
                            backgroundColor: const Color(0xffEAECF0),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          Gap(16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AdaptableIcon(
                                icons: viewModel.giveAway,
                                showBorder: false,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 28.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svgs/summary_clock.svg',
                                          height: 16.h,
                                          width: 16.w,
                                          colorFilter: const ColorFilter.mode(
                                            Color(0xffD0D5DD),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Gap(2.w),
                                        Text(
                                          '27 April',
                                          style: context.bodySmall!.copyWith(
                                            color: const Color(0xff475467),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gap(6.w),
                                  Container(
                                    height: 28.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svgs/message.svg',
                                          height: 16.h,
                                          width: 16.w,
                                          colorFilter: const ColorFilter.mode(
                                            Color(0xffD0D5DD),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Gap(2.w),
                                        Text(
                                          '2',
                                          style: context.bodySmall!.copyWith(
                                            color: const Color(0xff475467),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }
}
