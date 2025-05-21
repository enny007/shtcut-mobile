import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class SelectedMemberChip extends StatelessWidget {
  const SelectedMemberChip({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onRemove,
  });

  final String name;
  final String imageUrl;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      margin: EdgeInsets.only(right: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image with cancel button
          Stack(
            children: [
              // Profile image
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Cancel button
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    height: 22.h,
                    width: 22.w,
                    decoration: const BoxDecoration(
                      color: kcPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Name text
          SizedBox(height: 5.h),
          Text(
            name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xff151314),
                  fontWeight: FontWeight.w500,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
