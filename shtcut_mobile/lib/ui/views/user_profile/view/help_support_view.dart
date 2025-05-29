import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/user_profile/view_models/help_support_view_model.dart';
import 'package:shtcut_mobile/ui/views/user_profile/widgets/help_tile.dart';
import 'package:stacked/stacked.dart';

class HelpSupportView extends StackedView<HelpSupportViewModel> {
  const HelpSupportView({super.key});

  @override
  Widget builder(
      BuildContext context, HelpSupportViewModel viewModel, Widget? child) {
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
          'Help & Support',
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
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: viewModel.helpItems.length,
                separatorBuilder: (context, index) => Gap(10.h),
                itemBuilder: (context, index) {
                  final helpItem = viewModel.helpItems[index];
                  return GestureDetector(
                    onTap: () => viewModel.onHelpItemTap(index),
                    child: HelpTile(
                      leadingPath: helpItem['leadingPath'],
                      title: helpItem['title'],
                      subtitle: helpItem['subtitle'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HelpSupportViewModel viewModelBuilder(BuildContext context) {
    return HelpSupportViewModel();
  }
}
