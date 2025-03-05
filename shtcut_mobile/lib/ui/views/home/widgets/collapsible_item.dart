// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/adaptable_icon.dart';

class CollapsibleItem extends StatelessWidget {
  const CollapsibleItem({
    Key? key,
    required this.title,
    required this.icons,
    required this.showBorder,
    required this.buttonText,
    this.isSpaceX = false,
  }) : super(key: key);
  final String title;
  final List<Widget> icons;
  final bool showBorder;
  final String buttonText;
  final bool? isSpaceX;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFB),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xffEAECF0),
          width: 1.w,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 13.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    isSpaceX == true
                        ? CircleAvatar(
                            radius: 12.r,
                            backgroundImage: const AssetImage(
                              'assets/images/spacex.jpeg',
                            ),
                          )
                        : Container(
                            width: 24.w,
                            height: 24.h,
                            decoration: const BoxDecoration(
                              color: Color(0xff7A5AF8),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/svgs/camcorder.svg',
                            ),
                          ),
                    Gap(6.w),
                    Text(
                      title,
                      style: context.bodyMedium!.copyWith(
                        color: const Color(0xff2B2B2B),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/summary_clock.svg',
                      fit: BoxFit.scaleDown,
                      colorFilter: const ColorFilter.mode(
                        Color(0xffD0D5DD),
                        BlendMode.srcIn,
                      ),
                    ),
                    Gap(4.w),
                    Text(
                      '01:30 AM - 02:00 AM',
                      style: context.bodySmall!.copyWith(
                        color: const Color(0xff475467),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Gap(15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AdaptableIcon(
                icons: icons,
                showBorder: showBorder,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 74.w,
                  height: 24.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: kcPrimaryColor,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    buttonText,
                    style: context.bodySmall!.copyWith(
                      fontSize: 10.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
