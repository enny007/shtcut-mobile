import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.assetName,
    required this.actionName,
  });
  final String assetName;
  final String actionName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withValues(alpha: 0.04),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(assetName),
        ),
        Gap(4.h),
        Text(
          actionName,
          style: context.bodySmall!.copyWith(
            color: const Color(0xff726C6C),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
