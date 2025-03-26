import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/unsplash/unsplash_view_model.dart';
import 'package:stacked/stacked.dart';

class UnsplashView extends StackedView<UnsplashViewModel> {
  const UnsplashView({super.key});

  @override
  Widget builder(
      BuildContext context, UnsplashViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F3F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: SvgPicture.asset(
          'assets/svgs/unsplash_image.svg',
        ),
        centerTitle: false,
        title: Text(
          'Unsplash',
          style: context.bodySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          Text(
            '2 Selected',
            style: context.bodySmall!.copyWith(
              color: Colors.black,
            ),
          ),
          Gap(12.w),
          Container(
            height: 26.h,
            width: 71.w,
            padding: EdgeInsets.symmetric(
              horizontal: 11.46.w,
              vertical: 6.37.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: kcPrimaryColor,
              border: Border.all(
                color: const Color(0xff7F56D9),
                width: 0.64.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff101828).withValues(alpha: 0.05),
                  blurRadius: 1.27,
                  offset: const Offset(0, 0.64),
                  spreadRadius: 0,
                )
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              'Done',
              style: context.bodySmall!.copyWith(
                color: Colors.white,
                fontSize: 7.64.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsetsExtension.fromPercentage(
          lefthorizontalPercentage: 16.w,
          righthorizontalPercentage: 16.w,
          topverticalPercentage: 23.h,
          bottomverticalPercentage: 20.h,
          context: context,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: viewModel.unsplashController,
              validator: (_) {
                return null;
              },
              hintText: 'Search',
              prefixIcon: SvgPicture.asset(
                'assets/svgs/unsplash_search.svg',
              ),
            ),
            Gap(33.h),
            Text(
              'Browse by category',
              style: context.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Gap(20.h),
            
          ],
        ),
      ),
    );
  }

  @override
  UnsplashViewModel viewModelBuilder(BuildContext context) {
    return UnsplashViewModel();
  }
}
