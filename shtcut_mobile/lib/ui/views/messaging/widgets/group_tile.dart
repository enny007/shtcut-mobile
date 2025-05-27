import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class GroupTile extends StatelessWidget {
  const GroupTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.unreadCount = 0,
    this.timestamp = "12:00 PM",
  });
  final String title;
  final String subtitle;
  final int unreadCount;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 36.h,
        width: 36.w,
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(10.r),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/pic_1.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        title,
        style: context.bodyLarge!.copyWith(
          color: const Color(0xff151314),
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: context.bodySmall!.copyWith(
          color: const Color(0xff726C6C),
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timestamp,
            style: context.bodySmall!.copyWith(
              color: const Color(0xff726C6C),
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 5.h),
          if (unreadCount > 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                unreadCount.toString(),
                style: context.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
