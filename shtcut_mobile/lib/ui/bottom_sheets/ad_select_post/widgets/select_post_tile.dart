import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/adaptable_icon.dart';

class SelectPostTile extends StatelessWidget {
  const SelectPostTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFB),
        border: Border.all(
          color: const Color(0xffEAECF0),
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: const EdgeInsets.all(
        12,
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(2.05.r),
          child: Image.asset(
            'assets/images/pic_1.png',
            width: 54.w,
            height: 59.h,
          ),
        ),
        Gap(8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We built Safari to be the best browser for your Mac, iPhone  and enjoy the goodness of life....',
                style: context.bodySmall!.copyWith(
                    color: const Color(0xff2B2B2B),
                    overflow: TextOverflow.ellipsis),
                maxLines: 2,
              ),
              Gap(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: AdaptableIcon(
                      size: 28,
                      showBorder: true,
                      borderColor: kcPrimaryColor,
                      borderWidth: 1,
                      icons: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/pic_2.png'),
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/pic_2.png'),
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/pic_2.png'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/time_circle.svg',
                        height: 16.h,
                        width: 16.w,
                        colorFilter: const ColorFilter.mode(
                            Color(0xffD0D5dd), BlendMode.srcIn),
                      ),
                      Gap(4.w),
                      Text(
                        'Nov 12, 2024',
                        style: context.bodySmall!.copyWith(
                          color: kcSecondaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
