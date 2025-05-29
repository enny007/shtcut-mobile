import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/user_profile/view_models/contact_us_view_model.dart';
import 'package:stacked/stacked.dart';

class ContactUsView extends StackedView<ContactUsViewModel> {
  const ContactUsView({super.key});

  @override
  Widget builder(
      BuildContext context, ContactUsViewModel viewModel, Widget? child) {
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
          'Contact Us',
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
          topverticalPercentage: 0.h,
          bottomverticalPercentage: 160.h,
          context: context,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/help_gif.gif',
              ),
              Gap(26.h),
              Text(
                'Hi, let\'s help you today.',
                style: context.displaySmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(32.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Phone lines are available between ',
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff433E3F),
                      ),
                    ),
                    TextSpan(
                      text: '8:00am ',
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff433E3F),
                      ),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff433E3F),
                      ),
                    ),
                    TextSpan(
                      text: '5:00pm ',
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff433E3F),
                      ),
                    ),
                    TextSpan(
                      text: 'and on weekdays',
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff433E3F),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(8.h),
              Text(
                'Tap the number to call',
                style: context.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff433E3F),
                ),
              ),
              Gap(32.h),
              Text(
                '070000334678',
                style: context.displaySmall!.copyWith(
                  color: kcPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ContactUsViewModel viewModelBuilder(BuildContext context) {
    return ContactUsViewModel();
  }
}
