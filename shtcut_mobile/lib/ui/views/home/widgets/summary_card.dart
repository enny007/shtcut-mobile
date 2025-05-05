import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156.h,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 16.w,
        top: 12.h,
        bottom: 18.h,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFEFEFE),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary',
            style: context.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xff151314),
            ),
          ),
          Gap(2.h),
          Text(
            'Your social media manager',
            style: context.bodySmall!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _summaryCard(
                  title: 'Posts',
                  number: '5',
                  iconPath: 'assets/svgs/summary_calendar.svg',
                  context: context,
                ),
              ),
              Gap(8.w),
              Expanded(
                child: _summaryCard(
                  title: 'Tasks',
                  number: '2',
                  iconPath: 'assets/svgs/summary_clock.svg',
                  context: context,
                ),
              ),
              Gap(8.w),
              Expanded(
                child: _summaryCard(
                  title: 'Ads',
                  number: '5',
                  iconPath: 'assets/svgs/summary_calendar.svg',
                  context: context,
                ),
              ),
              Gap(8.w),
              Expanded(
                child: _summaryCard(
                  title: 'Streams',
                  number: '1',
                  iconPath: 'assets/svgs/summary_video.svg',
                  context: context,
                  isLongChar: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryCard({
    required String title,
    required String number,
    required String iconPath,
    required BuildContext context,
    bool isLongChar = false,
  }) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(
        left: isLongChar ? 6.w : 12.w,
        right: isLongChar ? 6.w : 0,
        top: 12.h,
      ),
      decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            width: 1.w,
            color: const Color(0xffEBECEE),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min, // Use minimum space needed
            children: [
              SvgPicture.asset(
                iconPath,
                fit: BoxFit.scaleDown,
              ),
              Gap(2.w),
              Flexible(
                child: Text(
                  title,
                  style: context.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  overflow:
                      TextOverflow.visible, // Allow text to be fully visible
                ),
              ),
            ],
          ),
          Gap(8.h),
          Text(
            number,
            style: context.displaySmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff2B2829),
            ),
          ),
        ],
      ),
    );
  }
}
