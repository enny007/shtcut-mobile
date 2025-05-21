import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/social_listening/social_listening_view_model.dart';
import 'package:stacked/stacked.dart';

class SocialListeningDetailView extends StackedView<SocialListeningViewModel> {
  const SocialListeningDetailView({
    super.key,
    this.topicName = '',
  });
  final String? topicName;
  @override
  Widget builder(
      BuildContext context, SocialListeningViewModel viewModel, Widget? child) {
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
          topicName ?? '',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  SocialListeningViewModel viewModelBuilder(BuildContext context) {
    return SocialListeningViewModel();
  }
}
