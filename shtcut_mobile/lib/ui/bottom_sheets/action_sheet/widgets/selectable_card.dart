import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class SelectableCard extends StatelessWidget {
  final Widget leadingImage;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final double borderRadius;
  // final bool isSelected;
  final VoidCallback onTap;
  final Color selectedBorderColor;
  final double selectedBorderWidth;

  const SelectableCard({
    Key? key,
    required this.leadingImage,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.backgroundColor = const Color(0xffFAFAFA),
    this.borderRadius = 8.0,
    // this.isSelected = false,
    this.selectedBorderColor = Colors.blue,
    this.selectedBorderWidth = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 50.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        child: Row(
          children: [
            // Leading image
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: leadingImage,
            ),
            Gap(10.w),

            // Title and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.bodySmall!.copyWith(
                      color: const Color(0xff433E3F),
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    subtitle,
                    style: context.bodySmall!.copyWith(
                      color: const Color(0xff726C6C),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
