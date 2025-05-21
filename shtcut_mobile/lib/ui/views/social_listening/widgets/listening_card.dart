import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/adaptable_icon.dart';

class ListeningCard extends StatelessWidget {
  const ListeningCard({
    super.key,
    required this.eventTitle,
    required this.eventTag,
    required this.subtitle,
    this.onTap,
    // required this.date,
  });
  final String eventTitle;
  final String eventTag;
  final String subtitle;
  final VoidCallback? onTap;
  // final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 125.h,
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(
        horizontal: 13.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: const Color(0xffF9FAFB),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eventTitle,
                style: context.bodyMedium!.copyWith(
                  color: const Color(0xff151314),
                ),
              ),
              Text(
                eventTag,
                style: context.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: kcPrimaryColor,
                ),
              ),
            ],
          ),
          Text(
            subtitle,
            style: context.bodySmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff726C6C),
            ),
          ),
          Gap(16.h),
          const LinearProgressIndicator(
            color: kcPrimaryColor,
            value: 1,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const AdaptableIcon(
                    size: 28,
                    showBorder: true,
                    borderColor: kcPrimaryColor,
                    borderWidth: 1,
                    icons: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pic_2.png'),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pic_2.png'),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pic_2.png'),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      // border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/calendar.svg',
                          height: 16.h,
                          width: 16.w,
                        ),
                        Gap(4.w),
                        Text(
                          '27 Sept',
                          style: context.bodySmall!.copyWith(
                            color: kcSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  // width: 74.w,
                  height: 24.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: kcPrimaryColor,
                  ),
                  // alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      'View',
                      style: context.bodySmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
