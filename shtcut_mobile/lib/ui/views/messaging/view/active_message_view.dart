import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/messaging/view_model/active_message_view_model.dart';
import 'package:stacked/stacked.dart';

class ActiveMessageView extends StackedView<ActiveMessageViewModel> {
  const ActiveMessageView({super.key});

  @override
  Widget builder(
      BuildContext context, ActiveMessageViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F3F8),
      appBar: AppBar(
        backgroundColor: const Color(0xffFEFEFE),
        toolbarHeight: 60.h,
        elevation: 0,
        leadingWidth: 45.w,
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
        centerTitle: false,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: GestureDetector(
            onTap: () => viewModel.navigateToMessageProfile(),
            child: Container(
              height: 36.h,
              width: 36.w,
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(10.r),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/pic_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Text(
            'Marketing Team',
            style: context.bodyLarge!.copyWith(
              color: const Color(0xff151314),
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            'You, Sarah Parker & 20 others',
            style: context.bodySmall!.copyWith(
              color: const Color(0xff726C6C),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsExtension.fromPercentage(
          lefthorizontalPercentage: 23.w,
          righthorizontalPercentage: 23.w,
          topverticalPercentage: 20.h,
          bottomverticalPercentage: 20.h,
          context: context,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 550.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffFEFEFE),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 12.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Today',
                    style: context.bodyLarge!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // height: 100.h,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffF7F7FC),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: GestureDetector(
            child: const Icon(
              Icons.add,
              color: kcPrimaryColor,
              // size: 18.29,
            ),
          ),
          title: TextField(
            controller: viewModel.chatController,
            decoration: InputDecoration(
              fillColor: const Color(0xffF7F7FC),
              focusColor: kcPrimaryColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          // title: AppTextField(
          //   controller: viewModel.chatController,
          //   validator: (value) {
          //     return null;
          //   },
          // ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svgs/happyemoji.svg',
              ),
              Gap(12.w),
              SvgPicture.asset(
                'assets/svgs/send-2.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ActiveMessageViewModel viewModelBuilder(BuildContext context) {
    return ActiveMessageViewModel();
  }
}
