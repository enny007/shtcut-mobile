import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class HelpTile extends StatelessWidget {
  const HelpTile({
    super.key,
    required this.leadingPath,
    required this.title,
    required this.subtitle,
  });
  final String leadingPath;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFEFEFE),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          height: 40.h,
          width: 44.w,
          decoration: BoxDecoration(
            color: const Color(0xffF4F6F9),
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(leadingPath),
        ),
        title: Text(
          title,
          style: context.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: context.bodySmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xff726C6C),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: kcPrimaryColor,
          size: 18.sp,
        ),
      ),
    );
  }
}
