import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/adaptable_icon.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String status;
  final String priority;
  final double progress;
  final String dueDate;
  final int comments;
  final Color statusColor;
  final Color priorityColor;

  const TaskCard({
    super.key,
    required this.title,
    required this.status,
    required this.priority,
    required this.progress,
    required this.dueDate,
    required this.comments,
    required this.statusColor,
    required this.priorityColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: const Color(0xffF9FAFB),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 24.h,
                width: 24.w,
                decoration: const BoxDecoration(
                  color: kcPrimaryColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/svgs/share.svg',
                ),
              ),
              Gap(6.w),
              Expanded(
                child: Text(
                  title,
                  style: context.bodyMedium!.copyWith(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Gap(12.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 8.w,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      status == 'In Progress'
                          ? 'assets/svgs/in_progress.svg'
                          : status == 'Done'
                              ? 'assets/svgs/done.svg'
                              : 'assets/svgs/to_do.svg',
                    ),
                    Gap(2.w),
                    Text(
                      status,
                      style: context.bodySmall!.copyWith(
                        color: kcSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(6.w),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 8.w,
                ),
                decoration: BoxDecoration(
                  color: priorityColor,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/priority.svg',
                    ),
                    Gap(2.w),
                    Text(
                      priority,
                      style: context.bodySmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(12.h),
          LinearProgressIndicator(
            color: kcPrimaryColor,
            value: progress,
            backgroundColor: const Color(0xFFE5E7EB),
          ),
          Gap(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: AdaptableIcon(
                  size: 28,
                  showBorder: true,
                  borderColor: Colors.white,
                  borderWidth: 2,
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
              ),
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
                      dueDate,
                      style: context.bodySmall!.copyWith(
                        color: kcSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(6.w),
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
                      'assets/svgs/message.svg',
                      height: 16.h,
                      width: 16.w,
                    ),
                    Gap(4.w),
                    Text(
                      comments.toString(),
                      style: context.bodySmall!.copyWith(
                        color: kcSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
