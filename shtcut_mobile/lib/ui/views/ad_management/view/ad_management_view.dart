import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/ad_management/view_model/ad_management_view_model.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/social_listening/widgets/listening_card.dart';
import 'package:stacked/stacked.dart';

class AdManagementView extends StackedView<AdManagementViewModel> {
  const AdManagementView({super.key});

  @override
  Widget builder(
      BuildContext context, AdManagementViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F3F8),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180.h,
              padding: EdgeInsets.only(
                left: 18.w,
                right: 18.w,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ad Management',
                    style: context.displayLarge!.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Gap(3.h),
                  Text(
                    'Create a new topic and leverage social listening data as a strategic partner',
                    style: context.bodyMedium!.copyWith(
                      color: const Color(0xffD9D6FE),
                    ),
                  ),
                ],
              ),
            ),
            Gap(25.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: viewModel.content.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Gap(12.h);
                },
                itemBuilder: (BuildContext context, int index) {
                  final eventTitle = viewModel.content[index]['eventTitle'];
                  final subtitle = viewModel.content[index]['subtitle'];
                  final eventTag = viewModel.content[index]['eventTag'];
                  final onTap = viewModel.content[index]['onTap'];
                  return ListeningCard(
                    eventTitle: eventTitle ?? '',
                    eventTag: eventTag ?? '',
                    subtitle: subtitle ?? '',
                    onTap: onTap ?? () {},
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 15.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .05),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: AppButton(
            callback: () {
              viewModel.navigateToCreateAdCampaign();
            },
            text: 'Create New Ad',
            color: kcPrimaryColor,
          ),
        ),
      ),
    );
  }

  @override
  AdManagementViewModel viewModelBuilder(BuildContext context) {
    return AdManagementViewModel();
  }
}
