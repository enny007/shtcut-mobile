import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class CampaignTile extends StatelessWidget {
  const CampaignTile({
    super.key,
    required this.leadingIconPath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final String leadingIconPath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          border: Border.all(
            color: const Color(0xffEAECF0),
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: kcPrimaryColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              leadingIconPath,
              // width: 17.w,
              // height: 17.h,
            ),
          ),
          title: Text(
            title,
            style: context.bodySmall!.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xff2B2829),
            ),
          ),
          subtitle: Text(
            subtitle,
            style: context.bodySmall!.copyWith(
              fontWeight: FontWeight.w300,
              color: const Color(0xff726C6C),
            ),
          ),
        ),
      ),
    );
  }
}
