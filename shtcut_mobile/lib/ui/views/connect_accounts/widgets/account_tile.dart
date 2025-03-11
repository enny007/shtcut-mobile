import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({
    super.key,
    required this.svgPath,
    required this.title,
  });
  final String svgPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 87.h,
      // width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xffFEFEFE),
        border: Border.all(
          color: const Color(0xffE3E3E3),
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          svgPath,
          fit: BoxFit.scaleDown,
        ),
        title: Text(
          title,
          style: context.bodyMedium!.copyWith(
            fontWeight: FontWeight.w700,
            color: kcTextHeadingColor,
          ),
        ),
        subtitle: Text(
          'Add Profile',
          style: context.bodySmall!.copyWith(
            color: kcTextColor,
          ),
        ),
        trailing: Container(
          height: 32.h,
          width: 95.w,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 6.h,
          ),
          decoration: BoxDecoration(
            color: kcPrimaryColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
          // alignment: Alignment.center,
          child: Text(
            'Connect',
            style: context.bodyMedium!.copyWith(
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
