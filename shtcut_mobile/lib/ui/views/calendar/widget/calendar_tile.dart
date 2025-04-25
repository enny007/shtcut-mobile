import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class CalendarTile extends StatelessWidget {
  const CalendarTile({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 118.h,
        decoration: BoxDecoration(
          color: const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Row(
            children: [
              Container(
                width: 8.w,
                color: kcPrimaryColor,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xffE3E3E3),
                        width: 1,
                      ),
                      right: BorderSide(
                        color: Color(0xffE3E3E3),
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Color(0xffE3E3E3),
                        width: 1,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 64.h,
                            width: 64.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.22.r),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/calendar_image.jpeg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gap(12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svgs/tiktok_logo.svg',
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                  Gap(6.w),
                                  SvgPicture.asset(
                                    'assets/svgs/x_logo.svg',
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                  Gap(6.w),
                                  SvgPicture.asset(
                                    'assets/svgs/facebook_logo.svg',
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                ],
                              ),
                              Gap(2.h),
                              SizedBox(
                                width: 160.w,
                                child: Text(
                                  'Exploring Paradise and love Live Life to the fullest...',
                                  style: context.bodySmall!.copyWith(
                                    color: Colors.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Gap(12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/time_circle.svg',
                                ),
                                Gap(10.w),
                                Text(
                                  '20/01/24',
                                  style: context.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Gap(7.w),
                                Text(
                                  '08:00am',
                                  style: context.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'By',
                                style: context.bodySmall!.copyWith(
                                  color: const Color(0xff0A0A0B),
                                ),
                              ),
                              Gap(4.w),
                              CircleAvatar(
                                backgroundImage: const AssetImage(
                                  'assets/images/stock_image_2.jpeg',
                                ),
                                radius: 10.r,
                              ),
                              Gap(4.w),
                              Text(
                                'Elaine',
                                style: context.bodySmall!.copyWith(
                                  color: const Color(0xff0A0A0B),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
