import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/connect_accounts/connect_accounts_view_model.dart';
import 'package:shtcut_mobile/ui/views/connect_accounts/widgets/account_tile.dart';
import 'package:stacked/stacked.dart';

class ConnectAccountsView extends StackedView<ConnectAccountsViewModel> {
  const ConnectAccountsView({super.key});

  @override
  Widget builder(
      BuildContext context, ConnectAccountsViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F3F8),
      body: Column(
        children: [
          Container(
            height: 233.h,
            decoration: const BoxDecoration(
              color: kcPrimaryColor,
            ),
            padding: EdgeInsets.only(
              left: 21.w,
              right: 21.w,
              top: 60.h,
              bottom: 15.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10.h),
                Text(
                  'Connect Channels',
                  style: context.displayMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(2.h),
                Text(
                  'Connect a channel where you wish to grow your audience. You can always add one later',
                  style: context.bodyMedium!.copyWith(
                    color: const Color(0xffD9D6FE),
                  ),
                ),
                Gap(18.h),
                Row(
                  children: [
                    SizedBox(
                      width: 86.w,
                      child: AppButton(
                        callback: () {},
                        color: Colors.white,
                        radius: 4.r,
                        text: 'Done',
                        textColor: kcPrimaryColor,
                      ),
                    ),
                    Gap(10.w),
                    SizedBox(
                      width: 140.w,
                      child: AppButton(
                        callback: () {},
                        color: Colors.transparent,
                        radius: 4.r,
                        text: 'Connect Later',
                        border: Border.all(
                          color: const Color(0xffFAFAFA),
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Gap(29.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ListView.separated(
                padding: EdgeInsets.only(
                  bottom: 20.h,
                ),
                itemCount: viewModel.accounts.length,
                separatorBuilder: (context, index) => Gap(16.h),
                itemBuilder: (context, index) {
                  final account = viewModel.accounts[index];
                  return AccountTile(
                    svgPath: account['svgPath']!,
                    title: account['title']!,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ConnectAccountsViewModel viewModelBuilder(BuildContext context) {
    return ConnectAccountsViewModel();
  }
}
