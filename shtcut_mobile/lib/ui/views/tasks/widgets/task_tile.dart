import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.assetName,
    required this.taskState,
    required this.taskNumber,
  });
  final String assetName;
  final String taskState;
  final String taskNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xffF9F9F9),
      ),
      padding: EdgeInsets.only(
        left: 12.w,
        top: 12.h,
        bottom: 12.h,
      ),
      // padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                assetName,
                fit: BoxFit.scaleDown,
              ),
              Gap(4.w),
              Text(
                taskState,
                style: context.bodySmall!.copyWith(
                  color: kcSecondaryColor,
                ),
              ),
            ],
          ),
          Gap(8.h),
          Text(
            taskNumber,
            style: context.displayMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
