import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class HashtagTile extends StatelessWidget {
  final String title;
  final String hashtag;
  final bool isSelected;
  final Function(bool?) onChanged;

  const HashtagTile({
    super.key,
    required this.title,
    required this.hashtag,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      leading: SizedBox(
        height: 16.h,
        width: 16.w,
        child: Checkbox(
          value: isSelected,
          onChanged: onChanged,
          activeColor: kcPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
      title: Text(
        title,
        style: context.bodySmall!.copyWith(
          color: kcSubHeadingColor,
        ),
      ),
      trailing: Text(
        hashtag,
        style: context.bodySmall!.copyWith(
          color: const Color(0xff5A5555),
        ),
      ),
    );
  }
}
