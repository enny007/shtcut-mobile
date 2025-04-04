import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class SelectableImageCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableImageCard({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 176.w,
        height: 190.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Selection indicator at the top-left corner
            Positioned(
              top: 8.h,
              left: 8.w,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? kcPrimaryColor
                      : Colors.white.withValues(alpha: .8),
                  border: Border.all(
                    color: isSelected
                        ? kcPrimaryColor
                        : Colors.white.withValues(alpha: .8),
                    width: 1.5.w,
                  ),
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14.sp,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
