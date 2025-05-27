import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class MembersProfileTile extends StatelessWidget {
  const MembersProfileTile({
    super.key,
    required this.title,
    this.isAdmin = false,
  });
  final String title;
  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 36.h,
        width: 36.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/pic_1.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        title,
        style: context.bodyMedium?.copyWith(
          color: const Color(0xff151314),
        ),
      ),
      trailing: isAdmin == true
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Admin',
                  style: context.bodyMedium!.copyWith(
                    color: const Color(0xff898384),
                  ),
                ),
                Gap(4.w),
              ],
            )
          : const Icon(
              Icons.keyboard_arrow_right,
              color: kcPrimaryColor,
            ),
    );
  }
}
